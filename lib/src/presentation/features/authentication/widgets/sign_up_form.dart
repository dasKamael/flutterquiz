import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/authentication/services/auth.service.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_elevated_button.dart';
import 'package:go_router/go_router.dart';

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

  final bool _hidePassword = true;
  bool _isLoading = false;

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
              obscureText: _hidePassword,
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
              obscureText: _hidePassword,
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
              loading: _isLoading,
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (passwordController.text != passwordrepeatController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: kWarnColor,
                        content: Text('Passwörter stimmen nicht überein'),
                      ),
                    );
                    return;
                  }
                  setState(() {
                    _isLoading = true;
                  });
                  (bool, String?) result = await ref.read(authServiceProvider.notifier).signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        username: userNameController.text,
                      );

                  if (result.$1 && mounted) {
                    context.go('/auth/success');
                  }

                  if (result.$1 == false && mounted) {
                    if (result.$2 == 'mail') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: kWarnColor,
                          content: Text('Email bereits vergeben'),
                        ),
                      );
                    }
                    if (result.$2 == 'username') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: kWarnColor,
                          content: Text('Username bereits vergeben'),
                        ),
                      );
                    }
                    setState(() {
                      _isLoading = false;
                    });
                    return;
                  }
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
