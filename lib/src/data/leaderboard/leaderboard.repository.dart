import 'package:flutterquiz/src/data/leaderboard/leaderboard.api.dart';
import 'package:flutterquiz/src/data/mapper/leaderboard.mapper.dart';
import 'package:flutterquiz/src/domain/leaderboard/models/leaderboard_entry.dart';
import 'package:flutterquiz/src/domain/leaderboard/repository/leaderboard.repository_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leaderboard.repository.g.dart';

class LeaderBoardRepository implements LeaderboardRepositoryInterface {
  final LeaderBoardApi leaderboardApi;

  LeaderBoardRepository({
    required this.leaderboardApi,
  });

  @override
  Future createLeaderboardEntry({
    required String quizId,
    String? userId,
    required String username,
    required int score,
  }) async {
    await leaderboardApi.createLeaderboardEntry(
      quizId: quizId,
      userId: userId,
      username: username,
      score: score,
    );
  }

  @override
  Future<List<LeaderboardEntry>> getLeaderboardByQuizId(String quizId) async {
    List entries = await leaderboardApi.getLeaderboardByQuizId(quizId);
    List<LeaderboardEntry> leaderboardEntries = [];
    for (Map entry in entries) {
      leaderboardEntries.add(LeaderboardMapper().toModel(entry));
    }
    return leaderboardEntries;
  }
}

/// Providers
@riverpod
LeaderBoardRepository leaderBoardRepository(LeaderBoardRepositoryRef ref) {
  final leaderboardApi = ref.watch(leaderBoardApiProvider);
  return LeaderBoardRepository(
    leaderboardApi: leaderboardApi,
  );
}
