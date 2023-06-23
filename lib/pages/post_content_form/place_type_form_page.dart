import 'package:flutter/material.dart';

class PlaceTypeFormPage extends StatefulWidget {
  const PlaceTypeFormPage({Key? key}) : super(key: key);

  @override
  PlaceTypeFormPageState createState() => PlaceTypeFormPageState();
}

class PlaceTypeFormPageState extends State<PlaceTypeFormPage> {
  late int placeTypeSelectedOption = -1;

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
                  placeTypeSelectedOption = 0;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (placeTypeSelectedOption == 0) {
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
                  placeTypeSelectedOption = 1;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (placeTypeSelectedOption == 1) {
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
                  placeTypeSelectedOption = 2;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (placeTypeSelectedOption == 2) {
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
                  placeTypeSelectedOption = 3;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (placeTypeSelectedOption == 3) {
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
                  placeTypeSelectedOption = 4;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (placeTypeSelectedOption == 4) {
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
                  placeTypeSelectedOption = 5;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (placeTypeSelectedOption == 5) {
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
                  placeTypeSelectedOption = 6;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (placeTypeSelectedOption == 6) {
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