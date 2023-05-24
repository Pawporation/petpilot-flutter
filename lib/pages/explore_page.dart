import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:petpilot/db/firestore.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  late MapController _mapController;
  bool _isLoading = true;
  List locations = List.empty(growable: true);
  LatLng _currentLocation = LatLng(37.319250, -121.929420);

  @override
  void initState() {
    super.initState();
    _determinePosition();
    _getNearbyLocations();
    _mapController = MapController();
  }

  Future<void> _getNearbyLocations() async {
    locations = await Firestore().getLocationsFromLocation(_currentLocation);
    setState(() {});
  }

  List<Marker> _buildMarkers() {
  return locations.map((location) {
    GeoPoint geoPoint = location['position']['geopoint'];
    double latitude = geoPoint.latitude;
    double longitude = geoPoint.longitude;
    LatLng point = LatLng(latitude, longitude);
    
    return Marker(
      point: point,
      builder: (ctx) => const Icon(
        Icons.location_on,
        color: Colors.black,
      ),
    );
  }).toList();
}



  // Determine the current position of the device.
  //
  // When the location services are not enabled or permissions
  // are denied the `Future` will return an error.
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the 
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale 
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately. 
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    } 

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      _isLoading = false;
    });
    // return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator()) // Show loading indicator while fetching location
        : FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: _currentLocation,
              zoom: 15,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/petpilot/clhs37jer00mq01pz1cjaawig/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicGV0cGlsb3QiLCJhIjoiY2xocjF1aTRtMmtrYzNlbzMzNzlvZHFoYSJ9.qMoZ-faYHI43IvUR3hWVow',
                additionalOptions: const {
                  'accessToken':
                      'pk.eyJ1IjoicGV0cGlsb3QiLCJhIjoiY2xocjF1aTRtMmtrYzNlbzMzNzlvZHFoYSJ9.qMoZ-faYHI43IvUR3hWVow',
                  'id': 'mapbox.mapbox-streets-v8'
                },
              ),
              MarkerLayer(
                markers: _buildMarkers(),
                // markers: [
                //   Marker(
                //       point: _currentLocation, builder: (ctx) => _PulseAnimation()),
                // ],
              )
            ],
          );
  }
}

class _PulseAnimation extends StatefulWidget {
  @override
  _PulseAnimationState createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<_PulseAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.5, end: 2.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: const Icon(
            Icons.circle,
            color: Colors.blue,
            size: 8.0,
          ),
        );
      },
    );
  }
}
