import 'package:flutterquiz/src/data/rating/data_source/api/rating.api.dart';
import 'package:flutterquiz/src/domain/rating/repository/rating.repository_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rating.repository.g.dart';

class RatingRepository implements RatingRepositoryInterface {
  final RatingApi ratingApi;

  RatingRepository({
    required this.ratingApi,
  });

  @override
  Future<void> sendRating({
    required double rating,
    required String quizId,
  }) async {
    await ratingApi.sendRating(
      rating: rating,
      quizId: quizId,
    );
  }
}

/// Providers
@riverpod
RatingRepository ratingRepository(RatingRepositoryRef ref) {
  final ratingApi = ref.watch(ratingApiProvider);
  return RatingRepository(
    ratingApi: ratingApi,
  );
}
