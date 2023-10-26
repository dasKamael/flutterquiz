import 'package:flutterquiz/src/common/mapper/dto_mapper.dart';
import 'package:flutterquiz/src/domain/leaderboard/models/leaderboard_entry.dart';

class LeaderboardMapper extends Mapper<LeaderboardEntry, Map> {
  @override
  LeaderboardEntry toModel(Map dto) {
    return LeaderboardEntry(
      id: dto['id'],
      userId: dto['user_id'] ?? '',
      quizId: dto['quiz_id'],
      username: dto['username'],
      score: dto['score'],
      createdAt: DateTime.parse(dto['created_at']),
      updatedAt: dto['updated_at'] != null ? DateTime.parse(dto['updated_at']) : null,
    );
  }
}
