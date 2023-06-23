import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PetFriendlinessFormPage extends StatefulWidget {
  const PetFriendlinessFormPage({Key? key}) : super(key: key);

  @override
  PetFriendlinessFormPageState createState() => PetFriendlinessFormPageState();
}

class PetFriendlinessFormPageState extends State<PetFriendlinessFormPage> {
  double petFriendlyRating = 0;
  late int dogsAllowedInside = 0;
  late int allowsLargeDogsSelectedOption = 0;
  late int isQuietSelectedOption = 0;
  late int hasTreatsSelectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          'How Pet-Friendly',
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.normal,
          ),
        ),
        RatingBar.builder(
          initialRating: petFriendlyRating,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 30.0,
          itemBuilder: (context, _) => const Icon(
            Icons.pets,
            color: Color(0xFF76c893),
          ),
          onRatingUpdate: (rating) {
            setState(() {
              petFriendlyRating = rating;
            });
          },
        ),
        // Add more form fields or content for Page 3
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Text(
                'Dogs Allowed Inside',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 2),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    dogsAllowedInside = 0;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected)) {
                        return const Color(0xFF76c893);
                      } else if (dogsAllowedInside == 0) {
                        return const Color(0xFF76c893);
                      } else {
                        return Colors.grey;
                      }
                    },
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(20, 20))
                ),
                child: const Text('Yes'),
              ),
              const SizedBox(width: 2),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    dogsAllowedInside = 1;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected)) {
                        return const Color(0xFF76c893);
                      } else if (dogsAllowedInside == 1) {
                        return const Color(0xFF76c893);
                      } else {
                        return Colors.grey;
                      }
                    },
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(20, 20))
                ),
                child: const Text('No'),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Text(
              'Allows Large Dogs (>50lbs)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 2),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    allowsLargeDogsSelectedOption = 0;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected)) {
                        return const Color(0xFF76c893);
                      } else if (allowsLargeDogsSelectedOption == 0) {
                        return const Color(0xFF76c893);
                      } else {
                        return Colors.grey;
                      }
                    },
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(20, 20))
                ),
                child: const Text('Yes'),
              ),
              const SizedBox(width: 2),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    allowsLargeDogsSelectedOption = 1;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected)) {
                        return const Color(0xFF76c893);
                      } else if (allowsLargeDogsSelectedOption == 1) {
                        return const Color(0xFF76c893);
                      } else {
                        return Colors.grey;
                      }
                    },
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(20, 20))
                ),
                child: const Text('No'),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Text(
                'Quiet Space',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 2),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isQuietSelectedOption = 0;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected)) {
                        return const Color(0xFF76c893);
                      } else if (isQuietSelectedOption == 0) {
                        return const Color(0xFF76c893);
                      } else {
                        return Colors.grey;
                      }
                    },
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(20, 20))
                ),
                child: const Text('Yes'),
              ),
              const SizedBox(width: 2),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isQuietSelectedOption = 1;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected)) {
                        return const Color(0xFF76c893);
                      } else if (isQuietSelectedOption == 1) {
                        return const Color(0xFF76c893);
                      } else {
                        return Colors.grey;
                      }
                    },
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(20, 20))
                ),
                child: const Text('No'),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Text(
                'Treats Available',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 2),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    hasTreatsSelectedOption = 0;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected)) {
                        return const Color(0xFF76c893);
                      } else if (hasTreatsSelectedOption == 0) {
                        return const Color(0xFF76c893);
                      } else {
                        return Colors.grey;
                      }
                    },
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(20, 20))
                ),
                child: const Text('Yes'),
              ),
              const SizedBox(width: 2),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    hasTreatsSelectedOption = 1;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected)) {
                        return const Color(0xFF76c893);
                      } else if (hasTreatsSelectedOption == 1) {
                        return const Color(0xFF76c893);
                      } else {
                        return Colors.grey;
                      }
                    },
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(20, 20))
                ),
                child: const Text('No'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
