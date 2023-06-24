import 'package:flutter/material.dart';
import 'package:petpilot/components/autocomplete_search.dart';
import 'package:petpilot/models/place_model.dart';

class LocationFormPage extends StatefulWidget {
  final TextEditingController searchController;
  final Function(PlaceModel) onLocationSelected;

  const LocationFormPage({Key? key, required this.searchController, required this.onLocationSelected})
      : super(key: key);

  @override
  LocationFormPageState createState() => LocationFormPageState();
}

class LocationFormPageState extends State<LocationFormPage> {
  PlaceModel? selectedPlace;

  void _onLocationSelected(PlaceModel placeModel) {
    setState(() {
      selectedPlace = placeModel;
    });
    widget.onLocationSelected(placeModel);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        AutoCompleteSearch(searchController: widget.searchController, onLocationSelected: _onLocationSelected, 
        hintText: "Enter Location / Address", includeBorder: true),
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
