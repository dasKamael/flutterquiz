import 'package:flutterquiz/src/data/rating/data_source/api/rating.api.dart';
import 'package:flutterquiz/src/data/rating/data_source/local/rating.local_data.dart';
import 'package:flutterquiz/src/domain/rating/repository/rating.repository_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rating.repository.g.dart';

class RatingRepository implements RatingRepositoryInterface {
  final RatingApi ratingApi;
  final RatingLocalData ratingLocalData;

  RatingRepository({
    required this.ratingApi,
    required this.ratingLocalData,
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
    await ratingLocalData.setQuizRated(quizId: quizId);
  }

  @override
  Future<bool> wasAlreadyRated({
    required String quizId,
  }) async {
    return await ratingLocalData.isQuizAlreadyRated(quizId: quizId);
  }
}

/// Providers
@riverpod
RatingRepository ratingRepository(RatingRepositoryRef ref) {
  final ratingApi = ref.watch(ratingApiProvider);
  final localRatingData = ref.watch(ratingLocalDataProvider);
  return RatingRepository(ratingApi: ratingApi, ratingLocalData: localRatingData);
}
