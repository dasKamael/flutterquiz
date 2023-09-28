import 'package:flutter/material.dart';
import 'package:flutterquiz/src/presentation/features/authentication/widgets/sign_in_form.dart';
import 'package:flutterquiz/src/presentation/features/authentication/widgets/sign_up_form.dart';
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
          SizedBox(
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SizedBox(
                    height: showSignIn ? 32 : 48,
                    child: UiElevatedButton(
                      isPrimary: true,
                      onPressed: () => setState(() => showSignIn = false),
                      child: Text('REGISTRIEREN', style: theme.textTheme.labelMedium),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: showSignIn ? 48 : 32,
                    child: UiElevatedButton(
                      isPrimary: true,
                      onPressed: () => setState(() => showSignIn = true),
                      child: Text('LOGIN', style: theme.textTheme.labelMedium),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (showSignIn) SignInForm() else const SignUpForm(),
        ],
      ),
    );
  }
}
