import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PetFriendlinessFormPage extends StatefulWidget {
  const PetFriendlinessFormPage({Key? key}) : super(key: key);

  @override
  PetFriendlinessFormPageState createState() => PetFriendlinessFormPageState();
}

class PetFriendlinessFormPageState extends State<PetFriendlinessFormPage> {
  double petFriendlyRating = 0;
  late int dogsAllowedInside = -1;
  late int allowsLargeDogs = -1;
  late int hasOutdoorSeating = -1;
  late int hasTreats = -1;

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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Text(
                'Has Outdoor Seating',
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
                    hasOutdoorSeating = hasOutdoorSeating == 0 ? -1 : 0;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected) || hasOutdoorSeating == 0) {
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
                    hasOutdoorSeating = hasOutdoorSeating == 1 ? -1 : 1;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected) || hasOutdoorSeating == 1) {
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
                    dogsAllowedInside = dogsAllowedInside = dogsAllowedInside == 0 ? -1 : 0;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected) || dogsAllowedInside == 0) {
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
                    dogsAllowedInside = dogsAllowedInside = dogsAllowedInside == 1 ? -1 : 1;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected) || dogsAllowedInside == 1) {
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
                    allowsLargeDogs = allowsLargeDogs = allowsLargeDogs == 0 ? -1 : 0;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected) || allowsLargeDogs == 0) {
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
                    allowsLargeDogs = allowsLargeDogs = allowsLargeDogs == 1 ? -1 : 1;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected) || allowsLargeDogs == 1) {
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
                    hasTreats = hasTreats = hasTreats == 0 ? -1 : 0;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected) || hasTreats == 0) {
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
                    hasTreats = hasTreats = hasTreats == 1 ? -1 : 1;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.selected) || hasTreats == 1) {
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
