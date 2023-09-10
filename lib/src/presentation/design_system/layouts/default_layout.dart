import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/authentication/services/auth.service.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:go_router/go_router.dart';

class DefaultLayout extends ConsumerWidget {
  const DefaultLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kSecondaryColor, kPrimaryColor],
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text('Home', style: theme.textTheme.labelMedium),
                          onPressed: () => context.go('/'),
                        ),
                        if (ref.read(authServiceProvider) != null)
                          TextButton(
                            child: Text('Dashboard', style: theme.textTheme.labelMedium),
                            onPressed: () => context.go('/management'),
                          ),
                        const Spacer(),
                        if (ref.read(authServiceProvider) == null)
                          ElevatedButton(
                            child: const Text('LogIn'),
                            onPressed: () => context.go('/auth'),
                          )
                        else
                          ElevatedButton(
                            child: const Text('LogOut'),
                            onPressed: () => context.go('/auth'),
                          ),
                      ],
                    ),
                  ),
                  Expanded(child: child),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
