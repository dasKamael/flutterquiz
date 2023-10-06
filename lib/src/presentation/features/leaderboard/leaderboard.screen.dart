import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/authentication/services/auth.service.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_app_error.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_elevated_button.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_loading.dart';
import 'package:flutterquiz/src/presentation/features/leaderboard/leaderboard.controller.dart';
import 'package:flutterquiz/src/presentation/features/leaderboard/widgets/leaderboard_list.dart';
import 'package:go_router/go_router.dart';

class LeaderboardScreen extends ConsumerStatefulWidget {
  const LeaderboardScreen({super.key, required this.quizId});

  final String quizId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends ConsumerState<LeaderboardScreen> {
  late final TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    final username = ref.read(authServiceProvider) != null ? ref.read(authServiceProvider)!.username : '';
    _usernameController = TextEditingController(text: username);
  }

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
                    Text('Dein Score ist: ${state.score}', style: theme.textTheme.headlineMedium),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: fixWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: const InputDecoration(hintText: 'Nutzernamen eingeben'),
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
                            child: const Text('Hinzufügen'),
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
                        child: const Text('Zurück zur Startseite'),
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
