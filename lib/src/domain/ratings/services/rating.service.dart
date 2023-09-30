import 'package:flutterquiz/src/data/rating/rating.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rating.service.g.dart';

class RatingService {
  RatingService({
    required this.repository,
  });

  final RatingRepository repository;

  Future<void> sendRating({required double rating, required String quizId}) async {
    await repository.sendRating(rating: rating, quizId: quizId);
  }
}

@riverpod
RatingService ratingService(RatingServiceRef ref) {
  RatingRepository repository = ref.watch(ratingRepositoryProvider);
  return RatingService(repository: repository);
}
