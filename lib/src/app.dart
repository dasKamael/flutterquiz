import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final uiTheme = ref.watch(uiThemeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Quiz',
      routerConfig: router,
      darkTheme: uiTheme.darkTheme,
    );
  }
}
