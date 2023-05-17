import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(37.319250, -121.929420),
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
        )
      ],
    );
  }
}
