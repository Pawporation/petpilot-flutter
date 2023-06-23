import 'package:flutter/material.dart';

class EventDescriptionFormPage extends StatelessWidget {
  const EventDescriptionFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('EventDescription'),
        // ElevatedButton(
        //   onPressed: () {
        //     // Go back to Page 3
        //     Navigator.of(context).pop();
        //   },
        //   child: const Text('Go back'),
        // ),
      ],
    );
  }
}