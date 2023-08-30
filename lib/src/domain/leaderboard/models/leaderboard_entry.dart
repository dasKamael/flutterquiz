import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_entry.freezed.dart';

@freezed
class LeaderboardEntry with _$LeaderboardEntry {
  const factory LeaderboardEntry({
    required String id,
    required String userId,
    required String quizId,
    required String username,
    required int score,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _LeaderboardEntry;
}
