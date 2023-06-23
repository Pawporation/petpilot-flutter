import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;

  final Function(LatLng) onLocationSelected; // New callback function

  const CustomSearchBar({Key? key, required this.searchController, required this.onLocationSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: GooglePlaceAutoCompleteTextField(
        textEditingController: searchController,
        googleAPIKey: "AIzaSyAnnFBx4GtRd6HTKw22KmiOqziWYlxOEv0",
        inputDecoration: const InputDecoration(
          hintText: 'Where To',
          hintStyle: TextStyle(color: Color(0xFF76c893)), // Change hint text color
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          prefixIcon: Icon(
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
          onLocationSelected(location); // Call the callback function with the selected location
        },
        itmClick: (Prediction prediction) {
          searchController.text = prediction.description!;

          searchController.selection = TextSelection.fromPosition(
              TextPosition(offset: prediction.description!.length));
        },
        // default 600 ms ,
      ),
    );
  }
}
