import 'package:flutter/material.dart';

class EventDetailsFormPage extends StatelessWidget {
  const EventDetailsFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('EventDetails'),
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