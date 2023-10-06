import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_complete_quiz.service.dart';
import 'package:flutterquiz/src/domain/quiz/services/quiz_score.service.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_app_error.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_elevated_button.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_loading.dart';
import 'package:go_router/go_router.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key, required this.quizId});

  final String quizId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return ref.watch(getCompleteQuizProvider(quizId: quizId)).when(
          data: (quiz) {
            final question = quiz.questions;
            if (question!.isEmpty) {
              return const Center(child: Text('Es ist ein Fehler aufgetreten. Bitte versuche es später erneut.'));
            }
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 1000,
                  child: Column(
                    children: [
                      Text(
                        quiz.title,
                        style: theme.textTheme.displayLarge?.copyWith(color: kTextColorLight),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        quiz.description,
                        style: theme.textTheme.bodySmall?.copyWith(color: kTextColorLight),
                      ),
                      const Spacer(),
                      UiElevatedButton(
                        child: Text('Quiz starten', style: theme.textTheme.labelMedium),
                        onPressed: () {
                          ref.read(quizScoreControllerProvider.notifier).reset();
                          context.go('/quiz/$quizId/${question[0].id}');
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            );
          },
          loading: () => const UiLoading(),
          error: (error, stackTrace) {
            log('Error: $error', stackTrace: stackTrace);
            return UiAppError(error: error);
          },
        );
  }
}
