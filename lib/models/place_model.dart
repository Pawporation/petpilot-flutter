import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  LatLng coords;
  String? name;
  String description;
  String? locationShortHand;

  PlaceModel(this.coords, this.name, this.description, this.locationShortHand);
}