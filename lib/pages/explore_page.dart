import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petpilot/components/custom_search_bar.dart';
import 'package:petpilot/components/filter_button.dart';
import 'package:petpilot/db/firestore.dart';

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
  List<String> filters = ['restaurant', 'event', 'outdoor', 'medical', 'grooming', 'dogcare', 'store'];
  List<String> selectedFilters = ['restaurant', 'event', 'outdoor', 'medical', 'grooming', 'dogcare', 'store'];
  List<Color> filterColors = [
    Colors.red,
    Colors.deepPurple,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.teal,
    Colors.amber,
  ];

  @override
  void initState() {
    super.initState();
    _determinePosition();
    _getNearbyLocations();
  }

  Future<void> _getNearbyLocations() async {
    locations = await Firestore().getLocationsFromLocation(_currentLocation);
    setState(() {
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

  void _updateSelectedFilter(String filter) {
    setState(() {
      final lowerCaseFilter = filter.toLowerCase();
      if (selectedFilters.contains(lowerCaseFilter)) {
        selectedFilters.remove(lowerCaseFilter);
      } else {
        selectedFilters.add(lowerCaseFilter);
      }
    });
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
                    child: CustomSearchBar(searchController: _searchController),
                  ),
                  Positioned(
                    top: 70.0,
                    left: 16.0,
                    right: 16.0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: filters.map((filter) {
                          int index = filters.indexOf(filter);
                          Color color = filterColors[index];
                          return FilterButton(
                            filter: filter,
                            isSelected: selectedFilters.contains(filter),
                            onPressed: () => _updateSelectedFilter(filter),
                            buttonColor: color,
                          );
                        }).toList(),
                      ),
                    ),
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
    List<Map<String, dynamic>> filteredLocations = locations
        .where((location) => selectedFilters.contains(location['type'].toString().toLowerCase()))
        .toList();

    return filteredLocations.map((location) {
      GeoPoint geoPoint = location['position']['geopoint'];
      double latitude = geoPoint.latitude;
      double longitude = geoPoint.longitude;
      LatLng point = LatLng(latitude, longitude);

      int filterIndex = filters.indexOf(location['type']);
      Color markerColor = filterColors[filterIndex];

      double hue = HSLColor.fromColor(markerColor).hue;
      BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarkerWithHue(hue);

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
