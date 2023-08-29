import 'package:flutterquiz/src/domain/models/leaderboard_entry.dart';
import 'package:flutterquiz/src/domain/models/quiz.dart';
import 'package:flutterquiz/src/domain/use_cases/leaderboard.use_case.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/leaderboard/leaderboard.state.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/quiz/quiz.controller.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/quiz/quiz_score.controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leaderboard.controller.g.dart';

@riverpod
class LeaderboardController extends _$LeaderboardController {
  @override
  FutureOr<LeaderboardState> build({required String quizId}) {
    LeaderboardState leaderboardState = const LeaderboardState(
      quizId: '',
      quizTitle: '',
      score: 0,
      entries: [],
    );

    final List<LeaderboardEntry> entries = ref.read(leaderBoardUseCaseProvider(quizId: quizId)).value ?? [];

    final Quiz quiz = ref.read(quizControllerProvider(quizId: quizId)).value!;

    leaderboardState = leaderboardState.copyWith(
      score: ref.read(quizScoreControllerProvider),
      quizId: quizId,
      quizTitle: quiz.title,
      entries: entries,
    );

    return leaderboardState;
  }
}
