import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/services/quiz_score.service.dart';
import 'package:flutterquiz/src/presentation/features/rating/user_rating.dart';
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
        Text(
          'Du hast das Quiz erfolgreich beendet!',
          style: theme.textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text('Dein Score ist: $quizscore', style: theme.textTheme.headlineMedium),
        const SizedBox(height: 80),
        UserRating(quizId: quizId),
        const SizedBox(height: 80),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Zum Leaderboard'),
              onPressed: () => context.go('/quiz/$quizId/leaderboard'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              child: const Text('Zurück zur Startseite'),
              onPressed: () => context.go('/'),
            ),
          ],
        ),
      ],
    );
  }
}
