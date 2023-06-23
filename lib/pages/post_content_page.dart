import 'package:flutter/material.dart';
import 'package:petpilot/pages/post_content_form/event_details_form_page.dart';
import 'package:petpilot/pages/post_content_form/location_form_page.dart';
import 'package:petpilot/pages/post_content_form/pet_friendliness_form_page.dart';
import 'package:petpilot/pages/post_content_form/place_type_form_page.dart';

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
                    LocationFormPage(),
                    PlaceTypeFormPage(),
                    PetFriendlinessFormPage(),
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
