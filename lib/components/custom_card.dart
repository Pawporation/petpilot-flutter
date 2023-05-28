import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;

  const CustomCard({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300, // Adjust the width as per your requirement
      height: 300, // Adjust the height as per your requirement
      child: Card(
        child: ListTile(
          title: Text(name),
        ),
      ),
    );
  }
}
