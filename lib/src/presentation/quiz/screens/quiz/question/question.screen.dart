import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/common/utils/question.util.dart';
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
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Container(
      color: theme.scaffoldBackgroundColor,
      child: ref.watch(questionControllerProvider(quizId: quizId, questionId: questionId)).when(
            data: (question) {
              return Column(
                children: [
                  Text(
                    question.question,
                    style: theme.textTheme.headlineLarge,
                  ),
                  if (question.answers!.isEmpty) const Text('No answers found'),
                  QuestionUtil.getQuestionType(question.type, question)
                ],
              );
            },
            loading: () => const Loading(),
            error: (error, stackTrace) {
              return AppError(error: error);
            },
          ),
    );
  }
}
