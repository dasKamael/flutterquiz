import 'package:flutterquiz/src/domain/leaderboard/models/leaderboard_entry.dart';
import 'package:flutterquiz/src/domain/leaderboard/services/leaderboard.service.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_complete_quiz.service.dart';
import 'package:flutterquiz/src/domain/quiz/services/quiz_score.service.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/leaderboard/leaderboard.state.dart';
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
    final List<LeaderboardEntry> entries = await getLeaderboardEntriesByQuizId(quizId: quizId);

    final Quiz quiz = ref.watch(getCompleteQuizProvider(quizId: quizId)).value!;

    leaderboardState = leaderboardState.copyWith(
      score: ref.read(quizScoreControllerProvider),
      quizId: quizId,
      quizTitle: quiz.title,
      entries: entries,
    );

    return leaderboardState;
  }

  Future<List<LeaderboardEntry>> getLeaderboardEntriesByQuizId({required String quizId}) async {
    return ref.watch(leaderBoardServiceProvider(quizId: quizId)).value ?? [];
  }

  Future<void> createLeaderboardEntry({required String username}) async {
    final quizId = leaderboardState.quizId;
    final score = leaderboardState.score;
    // TODO Check if user is logged in and get userid
    //final userId = ref.read(quizControllerProvider(quizId: quizId)).value!.userId;

    await ref.read(leaderBoardServiceProvider(quizId: quizId).notifier).createLeaderboardEntry(
          quizId: quizId,
          // userId: userId,
          username: username,
          score: score,
        );
  }
}