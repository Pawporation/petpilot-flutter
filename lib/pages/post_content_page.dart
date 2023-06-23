import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PostContentPage extends StatefulWidget {
  const PostContentPage({Key? key}) : super(key: key);

  @override
  PostContentPageState createState() => PostContentPageState();
}

class PostContentPageState extends State<PostContentPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goBack() {
    if (_currentPage > 0) {
      _goToPage(_currentPage - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
        child: Container(
          height: 385,
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Add a Pet-Friendly Place',
                style: TextStyle(
                  color: Color(0xFF76c893),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: const [
                    // Add your form pages here
                    Page1(),
                    Page2(),
                    Page3(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == _currentPage
                            ? const Color(0xFF76c893)
                            : Colors.grey.withOpacity(0.5),
                      ),
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF76c893),
                    ),
                    onPressed: _goBack,
                    child: const Text('<<'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF76c893),
                    ),
                    onPressed: () {
                      if (_currentPage < 2) {
                        _goToPage(_currentPage + 1);
                      } else {
                        // Perform form submission logic
                      }
                    },
                    child: Text(_currentPage < 2 ? '>>' : 'Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Page1State createState() => Page1State();
}

class Page1State extends State<Page1> {
  late int selectedOption = -1;

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
                  selectedOption = 0;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (selectedOption == 0) {
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
                  selectedOption = 1;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (selectedOption == 1) {
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
                  selectedOption = 2;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (selectedOption == 2) {
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
                  selectedOption = 3;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (selectedOption == 3) {
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
                  selectedOption = 4;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (selectedOption == 4) {
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
                  selectedOption = 5;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (selectedOption == 5) {
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
                  selectedOption = 6;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.selected)) {
                      return const Color(0xFF76c893);
                    } else if (selectedOption == 6) {
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

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Find a Business',
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: const Text(
            'or',
            style: TextStyle(fontSize: 14),
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Enter Address',
          ),
        ),
        // Add more form fields or content for Page 2
      ],
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Page3State createState() => Page3State();
}

class Page3State extends State<Page3> {
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
