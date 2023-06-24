import 'package:flutter/material.dart';
import 'package:petpilot/components/autocomplete_search.dart';
import 'package:petpilot/models/place_model.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final Function(PlaceModel) onLocationSelected;

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
      child: AutoCompleteSearch(searchController: searchController, onLocationSelected: onLocationSelected, hintText: "Where To", includeBorder: false,)
    );
  }
}
