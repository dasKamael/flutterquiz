import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/leaderboard/leaderboard.controller.dart';
import 'package:flutterquiz/src/presentation/shared_widgets/app_error.dart';
import 'package:flutterquiz/src/presentation/shared_widgets/loading.dart';
import 'package:go_router/go_router.dart';

class LeaderboardScreen extends ConsumerWidget {
  const LeaderboardScreen({super.key, required this.quizId});

  final String quizId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return ref.watch(LeaderboardControllerProvider(quizId: quizId)).when(
          data: (state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${state.quizTitle} Leaderboard', style: theme.textTheme.headlineLarge),
                const SizedBox(height: 16),
                Text('Your score is: ${state.score}', style: theme.textTheme.headlineMedium),
                const SizedBox(height: 40),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    ElevatedButton(
                      child: const Text('Back to Start'),
                      onPressed: () => context.go('/'),
                    ),
                  ],
                )
              ],
            );
          },
          loading: () => const Loading(),
          error: (error, stackTrace) {
            return AppError(error: stackTrace);
          },
        );
  }
}
