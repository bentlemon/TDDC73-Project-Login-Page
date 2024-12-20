import 'package:flutter/material.dart';
import 'package:create_acc_app/services/password_check.dart';

class PasswordWidget extends StatefulWidget {
  final Color backgroundColor;
  final double width;

  // Konstruktor för att ta emot data
  const PasswordWidget({super.key,
    this.backgroundColor = Colors.blueAccent,
    this.width = 400.0,
  });

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  double _strength = 0.0;
  String _strengthLabel = '';

  // Funktion som kallar på strength-checkern
  void _checkPasswordStrength(String password) {
    final strength = PasswordCheck.calculatePasswordStrength(password);
    setState(() {
      _strength = strength;
      _strengthLabel = PasswordCheck.getPasswordStrengthLabel(strength);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter a password:",
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 8.0),
        
        // Password textfield
        Container(
          width: widget.width,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            decoration: const InputDecoration(
              hintText: ". . .",
              hintStyle: TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
              ),
              border: InputBorder.none,
            ),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            cursorColor: Colors.white,
            onChanged: _checkPasswordStrength,
          ),
        ),

        const SizedBox(height: 16.0),

        // Password strenght meter
        SizedBox(
          width: widget.width,
          child: LinearProgressIndicator(
            value: _strength,
            backgroundColor: Colors.grey[300],
            color: _strength >= 0.75
                ? Colors.green
                : _strength >= 0.5
                    ? Colors.orange
                    : Colors.red,
            minHeight: 10.0,
          ),
        ),

        const SizedBox(height: 8.0),

        // Labels indicating strenght of password
        Text(
          _strengthLabel,
          style: TextStyle(
            color: _strength >= 0.75
                ? Colors.green
                : _strength >= 0.5
                    ? Colors.orange
                    : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
