import 'package:flutter/material.dart';

class LocationFormPage extends StatelessWidget {
  const LocationFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter Place / Address',
            prefixIcon: Icon(Icons.search),
          ),
        )
      ],
    );
  }
}
