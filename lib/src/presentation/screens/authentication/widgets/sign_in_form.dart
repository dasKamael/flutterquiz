import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/authentication/services/auth.service.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_elevated_button.dart';
import 'package:go_router/go_router.dart';

class SignInForm extends ConsumerWidget {
  SignInForm({super.key});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: 'richard.maasri@hotmail.de');
  final passwordController = TextEditingController(text: '123456');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              child: Text('LOGIN', style: theme.textTheme.labelMedium),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final (bool, String?) result = await ref.read(authServiceProvider.notifier).login(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context,
                      );

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
