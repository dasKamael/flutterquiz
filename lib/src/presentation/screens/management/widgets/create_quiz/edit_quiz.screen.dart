import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_complete_quiz.service.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_loading.dart';
import 'package:flutterquiz/src/presentation/screens/management/widgets/create_quiz/edit_quiz.controller.dart';
import 'package:flutterquiz/src/presentation/screens/management/widgets/create_quiz/edit_quiz.view.dart';

class EditQuizScreen extends ConsumerWidget {
  const EditQuizScreen({super.key, this.quizId});

  final String? quizId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return ref.watch(getCompleteQuizProvider(quizId: quizId)).when(
          data: (quiz) {
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
                          child:
                              Text('Create Quiz', style: theme.textTheme.labelMedium?.copyWith(color: kTextColorLight)),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 200,
                        height: 32,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: theme.elevatedButtonTheme.style?.copyWith(
                            backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                          ),
                          child:
                              Text('Verwerfen', style: theme.textTheme.labelMedium?.copyWith(color: kTextColorLight)),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            ref.read(editQuizControllerProvider(quiz: quiz).notifier).saveQuiz();
                          },
                          style: theme.elevatedButtonTheme.style?.copyWith(
                            backgroundColor: MaterialStateProperty.all(kSecondaryColor),
                          ),
                          child:
                              Text('Speichern', style: theme.textTheme.labelMedium?.copyWith(color: kTextColorLight)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  height: MediaQuery.of(context).size.height,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kCardBorderRadius),
                    child: EditQuizView(quiz: quiz),
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) => ErrorWidget(error),
          loading: () => const UiLoading(),
        );
  }
}
