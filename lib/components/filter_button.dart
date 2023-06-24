import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String filter;
  final bool isSelected;
  final VoidCallback onPressed;
  final Color buttonColor;

  const FilterButton({
    Key? key,
    required this.filter,
    required this.isSelected,
    required this.onPressed,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(isSelected ? buttonColor.withOpacity(0.8) : Colors.grey.withOpacity(0.5)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        child: Icon(
          _getFilterIcon(filter),
          color: Colors.white,
        ),
      ),
    );
  }

  IconData _getFilterIcon(String filter) {
    switch (filter.toLowerCase()) {
      case 'restaurant':
        return Icons.restaurant;
      case'cafe':
        return Icons.coffee;
      case 'event':
        return Icons.event;
      case 'outdoor':
        return Icons.hiking;
      case 'medical':
        return Icons.local_hospital;
      case 'grooming':
        return Icons.cut;
      case 'dogcare':
        return Icons.pets;
      case 'store':
        return Icons.store;
      default:
        return Icons.category;
    }
  }
}
