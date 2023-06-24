import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:petpilot/models/place_model.dart';

class LocationFormPage extends StatefulWidget {
  final TextEditingController searchController;

  const LocationFormPage({Key? key, required this.searchController})
      : super(key: key);

  @override
  LocationFormPageState createState() => LocationFormPageState();
}

class LocationFormPageState extends State<LocationFormPage> {
  PlaceModel? selectedPlace;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        GooglePlaceAutoCompleteTextField(
          textEditingController: widget.searchController,
          googleAPIKey: "AIzaSyAnnFBx4GtRd6HTKw22KmiOqziWYlxOEv0",
          inputDecoration: const InputDecoration(
            hintText: 'Enter Place / Address',
            hintStyle: TextStyle(color: Color(0xFF76c893)),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xFF76c893),
            ),
          ),
          debounceTime: 800,
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

            setState(() {
              selectedPlace = placeModel;
            });
          },
          itmClick: (Prediction prediction) {
            widget.searchController.text = prediction.description!;

            widget.searchController.selection = TextSelection.fromPosition(
              TextPosition(offset: prediction.description!.length),
            );
          },
        ),
        if (selectedPlace != null) ...[
          const SizedBox(height: 20),
          const Text(
            'Selected Location',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${selectedPlace!.name}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: ${selectedPlace!.locationShortHand}')
              ],
            ),
          ),
        ],
      ],
    );
  }
}
