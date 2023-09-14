import 'package:flutterquiz/src/common/supabase/supabase.provider.dart';
import 'package:flutterquiz/src/data/mapper/leaderboard.mapper.dart';
import 'package:flutterquiz/src/domain/authentication/services/auth.service.dart';
import 'package:flutterquiz/src/domain/leaderboard/models/leaderboard_entry.dart';
import 'package:flutterquiz/src/domain/leaderboard/services/leaderboard.service.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_complete_quiz.service.dart';
import 'package:flutterquiz/src/domain/quiz/services/quiz_score.service.dart';
import 'package:flutterquiz/src/presentation/screens/leaderboard/leaderboard.state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leaderboard.controller.g.dart';

@riverpod
class LeaderboardController extends _$LeaderboardController {
  LeaderboardState leaderboardState = const LeaderboardState(
    quizId: '',
    quizTitle: '',
    score: 0,
    entries: [],
  );

  @override
  FutureOr<LeaderboardState> build({required String quizId}) async {
    // final List<LeaderboardEntry> entries = await getLeaderboardEntriesByQuizId(quizId: quizId);

    final Quiz quiz = ref.watch(getCompleteQuizProvider(quizId: quizId)).value!;
    leaderboardState = leaderboardState.copyWith(
      score: ref.read(quizScoreControllerProvider),
      quizId: quizId,
      quizTitle: quiz.title,
      entries: [],
    );
    listenToLeaderboardEntryChanges();
    return leaderboardState;
  }

  void listenToLeaderboardEntryChanges() {
    ref.read(supabaseClientProvider).from('leaderboard').stream(primaryKey: ['id']).listen((event) {
      final List<LeaderboardEntry> entries = [];
      for (final entry in event) {
        entries.add(LeaderboardMapper().toModel(entry));
      }
      entries.sort((a, b) => b.score.compareTo(a.score));
      state = AsyncValue.data(state.value!.copyWith(entries: entries));
    });
  }

  Future<void> createLeaderboardEntry({required String username}) async {
    state = AsyncValue.data(state.value!.copyWith(isSubmitting: true));
    final quizId = leaderboardState.quizId;
    final score = leaderboardState.score;
    // TODO Check if user is logged in and get userid
    final userId = ref.read(authServiceProvider)?.id;
    await ref.read(leaderBoardServiceProvider(quizId: quizId).notifier).createLeaderboardEntry(
          quizId: quizId,
          userId: userId ?? '',
          username: username,
          score: score,
        );
    state = AsyncValue.data(state.value!.copyWith(isSubmitting: false));
  }
}
