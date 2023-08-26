import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class QuizResultScreen extends ConsumerWidget {
  const QuizResultScreen({super.key, required this.quizId});

  final String quizId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text('You finished the quiz!'),
          const Text('Your score is: 10'),
          Row(
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
      ),
    );
  }
}
