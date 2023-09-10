import 'package:flutter/material.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_elevated_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

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
                  child: Text('REGISTRIEREN', style: theme.textTheme.labelSmall),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 150,
                child: UiElevatedButton(
                  isPrimary: true,
                  child: Text('LOGIN', style: theme.textTheme.labelSmall),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 308,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bitte gib eine Email ein';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Passwort',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bitte gib eine Email ein';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  UiElevatedButton(
                    isPrimary: true,
                    fullWidth: true,
                    child: Text('REGISTRIEREN', style: theme.textTheme.labelMedium),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
