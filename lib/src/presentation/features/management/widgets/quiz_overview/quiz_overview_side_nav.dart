import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';

class QuizOverviewSideNav extends ConsumerWidget {
  const QuizOverviewSideNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {},
        style: theme.elevatedButtonTheme.style?.copyWith(
          backgroundColor: MaterialStateProperty.all(kSecondaryColor),
        ),
        child: Text('Quiz erstellen', style: theme.textTheme.labelMedium?.copyWith(color: kTextColorLight)),
      ),
    );
  }
}
