import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/screens/management/widgets/create_quiz/widgets/edit_quiz_card.dart';
import 'package:flutterquiz/src/presentation/screens/management/widgets/create_quiz/widgets/edit_quiz_side_nav.dart';

class EditQuizScreen extends ConsumerWidget {
  const EditQuizScreen({super.key, this.quizId});

  final String? quizId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 600,
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: theme.elevatedButtonTheme.style?.copyWith(
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  ),
                  child: Text('Create Quiz', style: theme.textTheme.labelMedium?.copyWith(color: kTextColorLight)),
                ),
              ),
              const Spacer(),
              const EditQuizSideNav(),
            ],
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 1000,
          height: 600,
          child: Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kCardBorderRadius),
              child: EditQuizCard(quizId: quizId),
            ),
          ),
        ),
      ],
    );
  }
}
