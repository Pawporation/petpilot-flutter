import 'package:flutter/material.dart';
import 'package:petpilot/models/place_type.dart';
import 'package:petpilot/pages/post_content_form/event_description_form_page.dart';
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
  int _currentPageIndex = 0;
  PlaceType? placeType;

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

  void _nextPage() {
    int pageToGoTo = _currentPageIndex + 1;
    _goToPage(pageToGoTo);
  }

  void _previousPage() {
    int pageToGoTo = _currentPageIndex - 1;
    if (pageToGoTo >= 0) {
      _goToPage(pageToGoTo);
    }
  }

  void updatePlaceType(PlaceType? placeType) {
    setState(() {
      this.placeType = placeType;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pages = [PlaceTypeFormPage(onPlaceTypeSelected: updatePlaceType), 
    const LocationFormPage(), const PetFriendlinessFormPage(),
    const EventDetailsFormPage(), const EventDescriptionFormPage()];
    var children = placeType == PlaceType.event ? [pages[0], pages[3], pages[4]] : [pages[0], pages[1], pages[2]];
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
                      _currentPageIndex = index;
                    });
                  },
                  children: children
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
                        color: (i == _currentPageIndex)
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
                    onPressed: _previousPage,
                    child: const Text('<<'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF76c893),
                    ),
                    onPressed: () {
                      if (_currentPageIndex < 2) {
                        _nextPage();
                      } else {
                        // Perform form submission logic
                      }
                    },
                    child: Text(_currentPageIndex < 2 ? '>>' : 'Submit'),
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
