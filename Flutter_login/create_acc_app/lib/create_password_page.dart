import 'package:create_acc_app/presentation/widgets/password_input.dart';
import 'package:flutter/material.dart';

class CreatePasswordPage extends StatelessWidget {
  const CreatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Password'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                PasswordWidget()
            ]
        ),
      ),
    );
  }
}
