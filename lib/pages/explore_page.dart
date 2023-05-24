import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  late GoogleMapController _mapController;
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

    print(locations.length);
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
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
                    right: 16.0,
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

      return Marker(
        markerId: MarkerId(location['name']),
        position: point,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
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
