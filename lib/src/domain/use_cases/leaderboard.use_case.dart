import 'package:flutterquiz/src/data/repository/leaderboard.repository.dart';
import 'package:flutterquiz/src/domain/models/leaderboard_entry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leaderboard.use_case.g.dart';

@riverpod
class LeaderBoardUseCase extends _$LeaderBoardUseCase {
  @override
  FutureOr<List<LeaderboardEntry>> build({required String quizId}) async {
    List<LeaderboardEntry> entries = await getLeaderboardByQuizId(quizId: quizId);
    return entries;
  }

  Future createLeaderboardEntry({
    required String quizId,
    String? userId,
    required String username,
    required int score,
  }) async {
    await ref.read(leaderBoardRepositoryProvider).createLeaderboardEntry(
          quizId: quizId,
          userId: userId,
          username: username,
          score: score,
        );
  }

  Future<List<LeaderboardEntry>> getLeaderboardByQuizId({required String quizId}) async {
    return await ref.read(leaderBoardRepositoryProvider).getLeaderboardByQuizId(quizId);
  }
}
