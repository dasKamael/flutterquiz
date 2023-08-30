import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/common/theme/ui_theme.dart';
import 'package:flutterquiz/src/common/utils/question.util.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_complete_quiz.service.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/quiz/question/question.controller.dart';
import 'package:flutterquiz/src/presentation/shared_widgets/app_error.dart';
import 'package:flutterquiz/src/presentation/shared_widgets/loading.dart';

class QuestionScreen extends ConsumerWidget {
  const QuestionScreen({super.key, required this.quizId, required this.questionId});

  final String quizId;
  final String questionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return ref.watch(questionControllerProvider(quizId: quizId, questionId: questionId)).when(
          data: (question) {
            final int questionCount = ref.read(getCompleteQuizProvider(quizId: quizId)).value!.questions!.length;
            final int questionPosition =
                ref.read(getCompleteQuizProvider(quizId: quizId)).value!.questions!.indexOf(question) + 1;

            return Center(
              child: SizedBox(
                width: 1000,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 20,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 20,
                            width: (1000 / questionCount) * questionPosition,
                            decoration: const BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Question $questionPosition of $questionCount',
                        style: theme.textTheme.bodySmall,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        question.question,
                        style: theme.textTheme.headlineLarge,
                      ),
                      if (question.answers!.isEmpty) const Text('No answers found'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: QuestionUtil.getQuestionType(question.type, question),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          loading: () => const Loading(),
          error: (error, stackTrace) {
            return AppError(error: stackTrace);
          },
        );
  }
}
