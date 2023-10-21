import 'package:flutter/material.dart';

class AuthSuccessScreen extends StatelessWidget {
  const AuthSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.email,
            size: 100,
          ),
          SizedBox(height: 20),
          Text(
            'Erfolgreich registriert! Bitte überprüfe deine Emails und bestätige deine Registrierung.',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
