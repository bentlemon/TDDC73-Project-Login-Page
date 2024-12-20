import 'package:flutter/material.dart';
import 'package:create_acc_app/services/name_check.dart';
import 'package:create_acc_app/services/email_check.dart';

class AccInputWidget extends StatefulWidget {
  final String title;
  final String type;
  final Color backgroundColor;
  final double width;
  final Function(bool isValid) onValidationChanged; // Validation status

  const AccInputWidget({super.key,
    required this.title,
    required this.type,
    this.backgroundColor = Colors.blue,
    this.width = 400.0,
    required this.onValidationChanged
  });

  @override
  State<AccInputWidget> createState() => _AccInputWidgetState();
}

class _AccInputWidgetState extends State<AccInputWidget> {
  String _feedback = ""; // Feedback for input

  void _validateInput(String value) {
    bool isValid = false;
    if (widget.type == 'name') {
      isValid = NameCheck.validateName(value);
      setState(() {
        _feedback = isValid ? 
        "" : "Invalid name. Please try again.";
      });
    } else if (widget.type == 'email') {
      isValid = EmailCheck.validateEmail(value);
      setState(() {
        _feedback = isValid ? 
        "" : "Email not found, please try again!";
      });
    }
    widget.onValidationChanged(isValid); // Setting the bool for val. check in main
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter ${widget.title}:",
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 8.0),

        Container(
          width: widget.width,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            onChanged: _validateInput,
            decoration: InputDecoration(
              hintText: 'Enter your ${widget.type}',
              hintStyle: const TextStyle(
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
          ),
        ),

        const SizedBox(height: 8.0),

        Text(
          _feedback,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
