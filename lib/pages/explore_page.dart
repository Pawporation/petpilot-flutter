import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petpilot/components/custom_search_bar.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  late GoogleMapController _mapController;
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = true;
  List<Map<String, dynamic>> locations = [];

  LatLng _currentLocation = const LatLng(37.319250, -121.929420);

  @override
  void initState() {
    super.initState();
    _determinePosition();
    _getNearbyLocations();
  }

  Future<void> _getNearbyLocations() async {
    final firestore = FirebaseFirestore.instance;
    final collectionReference = firestore.collection('locations');

    final QuerySnapshot snapshot = await collectionReference.get();
    setState(() {
      locations = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      _isLoading = false;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _mapController.setMapStyle('[{"featureType": "poi","stylers": [{"visibility": "off"}]}]');
  }

  void _myLocation() {
    _mapController.animateCamera(
      CameraUpdate.newLatLngZoom(_currentLocation, 15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(target: _currentLocation, zoom: 15),
                    markers: _buildMarkers(),
                  ),
                  Positioned(
                    top: 16.0,
                    left: 25.0,
                    right: 25.0,
                    child:CustomSearchBar(searchController: _searchController),
                  ),
                  Positioned(
                    bottom: 16.0,
                    left: 16.0,
                    child: FloatingActionButton(
                      onPressed: _myLocation,
                      tooltip: 'My Location',
                      mini: true,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blueAccent,
                      child: const Icon(Icons.my_location),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Set<Marker> _buildMarkers() {
    return locations.map((location) {
      GeoPoint geoPoint = location['position']['geopoint'];
      double latitude = geoPoint.latitude;
      double longitude = geoPoint.longitude;
      LatLng point = LatLng(latitude, longitude);

      BitmapDescriptor markerIcon;

      // Assign different marker colors based on location type
      switch (location['type']) {
        case 'restaurant':
          markerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
          break;
        case 'event':
          markerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet);
          break;
        case 'outdoor':
          markerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
          break;
        case 'medical':
          markerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
          break;
        case 'grooming':
          markerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose);
          break;
        case 'dogcare':
          markerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
          break;
        case 'store':
          markerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
          break;
        default:
          markerIcon = BitmapDescriptor.defaultMarker;
          break;
      }

      return Marker(
        markerId: MarkerId(location['name']),
        position: point,
        icon: markerIcon,
      );
    }).toSet();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    final position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      _isLoading = false;
    });
  }
}
