import 'package:flutterquiz/src/common/supabase/supabase.provider.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'rating.api.g.dart';

class RatingApi {
  RatingApi({required this.supabaseClient});

  final SupabaseClient supabaseClient;
  final Logger _logger = Logger('RatingApi');

  Future<void> sendRating({required double rating, required String quizId}) async {
    final userId = supabaseClient.auth.currentUser?.id;

    try {
      final response = await supabaseClient.rpc(
        'rate_quiz',
        params: {
          'value': rating,
          'userid': userId,
          'quizid': quizId,
        },
      );
    } catch (e) {
      _logger.severe('Error sending rating: $e');
    }
  }
}

@riverpod
RatingApi ratingApi(RatingApiRef ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return RatingApi(
    supabaseClient: supabaseClient,
  );
}
