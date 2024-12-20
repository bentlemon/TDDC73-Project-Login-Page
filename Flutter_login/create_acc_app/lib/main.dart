import 'package:flutter/material.dart';
import 'create_password_page.dart';
import 'package:create_acc_app/presentation/widgets/user_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Set<int> _validFields = {};

  // Adds an index to set if textfield is
  // valid. Used for activation for next page.
  void _handleValidationChange(bool isValid, int index) {
    setState(() {
      if (isValid) {
        _validFields.add(index);
      } else {
        _validFields.remove(index);
      }
    });
  }

  // Another ugly solution for 
  // checking if set is the same
  // lenght as the numbers of 
  // textfields existing in build.
  bool _isFormValid() {
    return _validFields.length == 3;
  }

  // Page build with custom widgets! 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create account'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Widgets för account reg (namn)
              AccInputWidget(
                title: 'first name',
                type: 'name',
                backgroundColor: Colors.blueAccent,
                onValidationChanged: (isValid) => _handleValidationChange(isValid, 0),
              ),

              const SizedBox(height: 20),

              AccInputWidget(
                title: 'last name',
                type: 'name',
                backgroundColor: Colors.blueAccent,
                onValidationChanged: (isValid) => _handleValidationChange(isValid, 1),
              ),

              const SizedBox(height: 20),
                            
              // Email inputfield
              AccInputWidget(
                title: 'an email',
                type: 'email',
                backgroundColor: Colors.blueAccent,
                onValidationChanged: (isValid) => _handleValidationChange(isValid, 2),
              ),

              const SizedBox(height: 15),
              
              // Button for next page!
              // Activates when all textfields returns isValid=true
              Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    onPressed: _isFormValid()
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CreatePasswordPage(),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: Text(
                      "Next page",
                      style: TextStyle(
                        color: _isFormValid()
                            ? const Color.fromARGB(255, 29, 29, 29)
                            : const Color(0xFF7C7C7C),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
