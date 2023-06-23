import 'package:flutter/material.dart';
import 'package:petpilot/models/place_type.dart';

class PlaceTypeFormPage extends StatefulWidget {
  final Function(PlaceType?) onPlaceTypeSelected;

  const PlaceTypeFormPage({Key? key, required this.onPlaceTypeSelected}) : super(key: key);

  @override
  PlaceTypeFormPageState createState() => PlaceTypeFormPageState();
}

class PlaceTypeFormPageState extends State<PlaceTypeFormPage> {
  PlaceType? _placeType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(top: 20)),
        const Text(
          'Place Type',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 5)),
        const Text(
          'Select One',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 10,),
        Wrap(
          spacing: 8, // Adjust the spacing between buttons
          runSpacing: 8, // Adjust the run spacing between rows of buttons
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _placeType = PlaceType.event;
                });
                widget.onPlaceTypeSelected(_placeType);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (_placeType == PlaceType.event) {
                      return const Color(0xFF76c893);
                    } else {
                      return Colors.grey;
                    }
                  },
                ),
              ),
              child: const Text('Event'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _placeType = PlaceType.restaurant;
                });
                widget.onPlaceTypeSelected(_placeType);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (_placeType == PlaceType.restaurant) {
                      return const Color(0xFF76c893);
                    } else {
                      return Colors.grey;
                    }
                  },
                ),
              ),
              child: const Text('Restaurant / Cafe'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _placeType = PlaceType.outdoor;
                });
                widget.onPlaceTypeSelected(_placeType);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (_placeType == PlaceType.outdoor) {
                      return const Color(0xFF76c893);
                    } else {
                      return Colors.grey;
                    }
                  },
                ),
              ),
              child: const Text('Outdoor'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _placeType = PlaceType.medical;
                });
                widget.onPlaceTypeSelected(_placeType);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (_placeType == PlaceType.medical) {
                      return const Color(0xFF76c893);
                    } else {
                      return Colors.grey;
                    }
                  },
                ),
              ),
              child: const Text('Medical'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _placeType = PlaceType.grooming;
                });
                widget.onPlaceTypeSelected(_placeType);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (_placeType == PlaceType.grooming) {
                      return const Color(0xFF76c893);
                    } else {
                      return Colors.grey;
                    }
                  },
                ),
              ),
              child: const Text('Grooming'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _placeType = PlaceType.dogcare;
                });
                widget.onPlaceTypeSelected(_placeType);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (_placeType == PlaceType.dogcare) {
                      return const Color(0xFF76c893);
                    } else {
                      return Colors.grey;
                    }
                  },
                ),
              ),
              child: const Text('Dogcare'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _placeType = PlaceType.store;
                });
                widget.onPlaceTypeSelected(_placeType);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (_placeType == PlaceType.store) {
                      return const Color(0xFF76c893);
                    } else {
                      return Colors.grey;
                    }
                  },
                ),
              ),
              child: const Text('Store'),
            ),
          ],
        ),
      ],
    );
  }
}