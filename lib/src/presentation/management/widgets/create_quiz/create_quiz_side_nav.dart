import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/common/theme/ui_theme.dart';

class CreateQuizSideNav extends ConsumerWidget {
  const CreateQuizSideNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 32,
          child: ElevatedButton(
            onPressed: () {},
            style: theme.elevatedButtonTheme.style?.copyWith(
              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
            ),
            child: Text('Verwerfen', style: theme.textTheme.labelMedium?.copyWith(color: kLightTextColor)),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: () {},
            style: theme.elevatedButtonTheme.style?.copyWith(
              backgroundColor: MaterialStateProperty.all(kSecondaryColor),
            ),
            child: Text('Speichern', style: theme.textTheme.labelMedium?.copyWith(color: kTextColorLight)),
          ),
        ),
      ],
    );
  }
}
