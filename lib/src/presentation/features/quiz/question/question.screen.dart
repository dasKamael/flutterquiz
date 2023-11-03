import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/common/utils/question.util.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_complete_quiz.service.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_app_error.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_loading.dart';
import 'package:flutterquiz/src/presentation/features/quiz/question/question.controller.dart';

class QuestionScreen extends ConsumerWidget {
  const QuestionScreen({super.key, required this.quizId, required this.questionId});

  final String quizId;
  final String questionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return ref.watch(questionControllerProvider(quizId: quizId, questionId: questionId)).when(
          data: (question) {
            final int questionCount = ref.watch(getCompleteQuizProvider(quizId: quizId)).value!.questions!.length;
            final int questionPosition =
                ref.watch(getCompleteQuizProvider(quizId: quizId)).value!.questions!.indexOf(question) + 1;

            return SizedBox(
              width: 1000,
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Frage $questionPosition von $questionCount',
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      question.question,
                      style: theme.textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 20),
                    if (question.answers!.isEmpty)
                      const Text('Keine Antwort gefunden. Bitte versuche es später erneut.'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: QuestionUtil.getQuestionType(question.type, question),
                    ),
                  ],
                ),
              ),
            );
          },
          loading: () => const UiLoading(),
          error: (error, stackTrace) {
            return UiAppError(error: error);
          },
        );
  }
}
