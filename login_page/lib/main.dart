import 'package:flutter/material.dart';
import 'presentation/widgets/user_inputs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create account page'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Första instansen av MyCustomWidget
              MyCustomWidget(
                title: 'Hello, Flutter!',
                backgroundColor: Colors.green,
              ),
              const SizedBox(height: 20), // Mellanrum mellan widgets

              // Andra instansen av MyCustomWidget
              MyCustomWidget(
                title: 'Welcome to Flutter!',
                backgroundColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
