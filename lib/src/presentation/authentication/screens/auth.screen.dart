import 'package:flutter/material.dart';
import 'package:flutterquiz/src/presentation/authentication/widgets/sign_in_form.dart';
import 'package:flutterquiz/src/presentation/authentication/widgets/sign_up_form.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_elevated_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showSignIn = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: UiElevatedButton(
                  isPrimary: true,
                  onPressed: () => setState(() => showSignIn = false),
                  child: Text('REGISTRIEREN', style: theme.textTheme.labelSmall),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 150,
                child: UiElevatedButton(
                  isPrimary: true,
                  onPressed: () => setState(() => showSignIn = true),
                  child: Text('LOGIN', style: theme.textTheme.labelSmall),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (showSignIn) SignInForm() else const SignUpForm(),
        ],
      ),
    );
  }
}
