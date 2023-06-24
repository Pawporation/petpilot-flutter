import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:petpilot/models/place_model.dart';

class AutoCompleteSearch extends StatelessWidget {
  final TextEditingController searchController;
  final Function(PlaceModel) onLocationSelected;
  final String hintText;
  final bool includeBorder;
  const AutoCompleteSearch({Key? key, required this.searchController, required this.onLocationSelected, required this.hintText, required this.includeBorder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GooglePlaceAutoCompleteTextField(
      textEditingController: searchController,
      googleAPIKey: "AIzaSyAnnFBx4GtRd6HTKw22KmiOqziWYlxOEv0",
      inputDecoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF76c893)), // Change hint text color
        border: includeBorder ? const UnderlineInputBorder() : InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xFF76c893), // Change search icon color
        ),
      ),
      debounceTime: 800,
      //countries: ["us"],
      isLatLngRequired: true,
      getPlaceDetailWithLatLng: (Prediction prediction) {
        double latitude = double.parse(prediction.lat!);
        double longitude = double.parse(prediction.lng!);
        LatLng location = LatLng(latitude, longitude);
        PlaceModel placeModel = PlaceModel(
          location,
          prediction.structuredFormatting!.mainText,
          prediction.description!,
          prediction.structuredFormatting!.secondaryText,
        );
        onLocationSelected(placeModel); // Call the callback function with the selected location
      },
      itmClick: (Prediction prediction) {
        searchController.text = prediction.description!;

        searchController.selection = TextSelection.fromPosition(
            TextPosition(offset: prediction.description!.length));
      },
      // default 600 ms ,
    );
  }

}