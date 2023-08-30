import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/presentation/screens/leaderboard/leaderboard.controller.dart';
import 'package:flutterquiz/src/presentation/screens/leaderboard/widgets/leaderboard_list.dart';
import 'package:flutterquiz/src/presentation/shared_widgets/app_error.dart';
import 'package:flutterquiz/src/presentation/shared_widgets/loading.dart';
import 'package:go_router/go_router.dart';

class LeaderboardScreen extends ConsumerStatefulWidget {
  const LeaderboardScreen({super.key, required this.quizId});

  final String quizId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends ConsumerState<LeaderboardScreen> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ref.watch(LeaderboardControllerProvider(quizId: widget.quizId)).when(
          data: (state) {
            return Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${state.quizTitle} Leaderboard', style: theme.textTheme.headlineLarge),
                  const SizedBox(height: 16),
                  Text('Your score is: ${state.score}', style: theme.textTheme.headlineMedium),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(hintText: 'Enter username'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        child: const Text('Add'),
                        onPressed: () async {
                          await ref
                              .read(LeaderboardControllerProvider(quizId: widget.quizId).notifier)
                              .createLeaderboardEntry(
                                username: _usernameController.text,
                              );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  LeaderboardList(entries: state.entries),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: const Text('Back to Home'),
                        onPressed: () => context.go('/'),
                      ),
                    ],
                  )
                ],
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
