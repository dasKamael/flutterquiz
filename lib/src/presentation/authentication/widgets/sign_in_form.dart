import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_elevated_button.dart';

class SignInForm extends ConsumerWidget {
  SignInForm({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 308,
      child: Form(
        key: formKey,
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
    );
  }
}
