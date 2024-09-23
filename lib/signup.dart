import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);  // Go back to the previous page (Login Page)
          },
          child: const Text('Back to Login'),
        ),
      ),
    );
  }
}
