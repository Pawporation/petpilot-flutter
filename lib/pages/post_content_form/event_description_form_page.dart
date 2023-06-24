import 'package:flutter/material.dart';

class EventDescriptionFormPage extends StatelessWidget {
  const EventDescriptionFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20),
        Text(
          'Event Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        TextField(
          maxLines: 5, // Adjust the number of lines as per your requirement
          maxLength: 250, // Set the character limit for the event description
          decoration: InputDecoration(
            hintText: 'Enter event description',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
