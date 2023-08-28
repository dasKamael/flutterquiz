import 'package:flutterquiz/src/common/supabase/supabase.provider.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'leaderboard.api.g.dart';

class LeaderBoardApi {
  LeaderBoardApi({required this.supabaseClient});

  final SupabaseClient supabaseClient;
  final Logger _logger = Logger('LeaderBoardApi');

  Future<List> getLeaderboardByQuizId(String quizId) async {
    try {
      List list = await supabaseClient.from('leaderboard').select().eq('quiz_id', quizId);
      return list;
    } catch (e) {
      _logger.info('Error getting leaderboard by quiz id: $e');
      return [];
    }
  }

  Future<void> createLeaderboardEntry({
    required String quizId,
    required String userId,
    required String username,
    required int score,
  }) async {
    try {
      await supabaseClient.from('leaderboard').insert([
        {
          'quiz_id': quizId,
          'user_id': userId,
          'username': username,
          'score': score,
        }
      ]);
    } catch (e) {
      _logger.info('Error creating leaderboard entry: $e');
    }
  }
}

@riverpod
LeaderBoardApi leaderBoardApi(LeaderBoardApiRef ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return LeaderBoardApi(
    supabaseClient: supabaseClient,
  );
}
