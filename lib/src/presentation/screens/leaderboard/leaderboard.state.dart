import 'package:flutterquiz/src/domain/leaderboard/models/leaderboard_entry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard.state.freezed.dart';

@freezed
class LeaderboardState with _$LeaderboardState {
  const factory LeaderboardState({
    required String quizId,
    required String quizTitle,
    required int score,
    required List<LeaderboardEntry> entries,
  }) = _LeaderboardState;
}
