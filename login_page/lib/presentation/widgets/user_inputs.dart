import 'package:flutter/material.dart';

class MyCustomWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;

  // Konstruktor för att ta emot data
  MyCustomWidget({
    required this.title,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
