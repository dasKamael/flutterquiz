import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/authentication/services/auth.service.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_elevated_button.dart';
import 'package:go_router/go_router.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({super.key});

  @override
  ConsumerState<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: 'richard.maasri@hotmail.de');
  final passwordController = TextEditingController(text: '123456');

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
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Passwort',
              ),
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
              child: Text('LOGIN', style: theme.textTheme.labelMedium),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    _isLoading = true;
                  });
                  final (bool, String?) result = await ref.read(authServiceProvider.notifier).login(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context,
                      );

                  setState(() {
                    _isLoading = false;
                  });

                  if (result.$1 == true && context.mounted) {
                    context.go('/management');
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
