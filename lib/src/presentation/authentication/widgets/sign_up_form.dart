import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/authentication/services/auth.service.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_elevated_button.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordrepeatController = TextEditingController();

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 400,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: userNameController,
              decoration: const InputDecoration(
                hintText: 'Username',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bitte gib einen Nutzernamen ein';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
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
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Passwort',
              ),
              obscureText: hidePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bitte gib ein Passwort ein';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: passwordrepeatController,
              decoration: const InputDecoration(
                hintText: 'Passwort wiederholen',
              ),
              obscureText: hidePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bitte gib ein Passwort ein';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            UiElevatedButton(
              isPrimary: true,
              fullWidth: true,
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (passwordController.text != passwordrepeatController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Passwörter stimmen nicht überein'),
                      ),
                    );
                    return;
                  }
                  (bool, String?) result = await ref.read(authServiceProvider.notifier).signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        username: userNameController.text,
                      );

                  log(result.$2.toString());
                }
              },
              child: Text('REGISTRIEREN', style: theme.textTheme.labelMedium),
            ),
          ],
        ),
      ),
    );
  }
}
