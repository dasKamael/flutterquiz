import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/quiz/quiz_score.controller.dart';
import 'package:go_router/go_router.dart';

class QuizResultScreen extends ConsumerWidget {
  const QuizResultScreen({super.key, required this.quizId});

  final String quizId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final int quizscore = ref.read(quizScoreControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('You finished the quiz!', style: theme.textTheme.headlineLarge),
        const SizedBox(height: 16),
        Text('Your score is: $quizscore', style: theme.textTheme.headlineMedium),
        const SizedBox(height: 40),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Leaderboard'),
              onPressed: () => context.go('/quiz/$quizId/leaderboard'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              child: const Text('Back to home'),
              onPressed: () => context.go('/'),
            ),
          ],
        )
      ],
    );
  }
}
