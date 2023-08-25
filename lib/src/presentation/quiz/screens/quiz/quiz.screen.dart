import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/quiz/quiz.controller.dart';
import 'package:flutterquiz/src/presentation/shared_widgets/app_error.dart';
import 'package:flutterquiz/src/presentation/shared_widgets/loading.dart';
import 'package:go_router/go_router.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key, required this.quizId});

  final String quizId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Container(
      color: theme.scaffoldBackgroundColor,
      child: ref.watch(quizControllerProvider(quizId: quizId)).when(
            data: (quiz) {
              final question = quiz.questions;
              if (question!.isEmpty) {
                return const Text('Question not found');
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      quiz.title,
                      style: theme.textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 40),
                    // TODO DESCRIPTION
                    OutlinedButton(
                      child: const Text('Start Quiz'),
                      onPressed: () {
                        context.push('/quiz/$quizId/${question[0].id}');
                      },
                    ),
                  ],
                ),
              );
            },
            loading: () => const Loading(),
            error: (error, stackTrace) {
              return AppError(error: stackTrace);
            },
          ),
    );
  }
}
