import 'package:flutterquiz/src/domain/leaderboard/models/leaderboard_entry.dart';

abstract class LeaderboardRepositoryInterface {
  Future<void> createLeaderboardEntry({
    required String quizId,
    String? userId,
    required String username,
    required int score,
  });
  Future<List<LeaderboardEntry>> getLeaderboardByQuizId(String quizId);
}
