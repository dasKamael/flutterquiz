import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_app_error.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_elevated_button.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_loading.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/leaderboard/leaderboard.controller.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/leaderboard/widgets/leaderboard_list.dart';
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
    const double fixWidth = 400;
    return ref.watch(LeaderboardControllerProvider(quizId: widget.quizId)).when(
          data: (state) {
            return SizedBox(
              width: fixWidth,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${state.quizTitle} Leaderboard', style: theme.textTheme.headlineLarge),
                    const SizedBox(height: 16),
                    Text('Your score is: ${state.score}', style: theme.textTheme.headlineMedium),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: fixWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: const InputDecoration(hintText: 'Enter username'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          UiElevatedButton(
                            loading: state.isSubmitting,
                            onPressed: () async {
                              await ref
                                  .read(LeaderboardControllerProvider(quizId: widget.quizId).notifier)
                                  .createLeaderboardEntry(
                                    username: _usernameController.text,
                                  );
                            },
                            child: const Text('Add'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(width: fixWidth, child: LeaderboardList(entries: state.entries)),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: fixWidth,
                      child: ElevatedButton(
                        child: const Text('Back to Home'),
                        onPressed: () => context.go('/'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          loading: () => const UiLoading(),
          error: (error, stackTrace) {
            return UiAppError(error: stackTrace);
          },
        );
  }
}
