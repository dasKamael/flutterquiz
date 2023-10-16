import 'package:flutterquiz/src/data/rating/rating.repository.dart';
import 'package:flutterquiz/src/domain/rating/repository/rating.repository_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rating.service.g.dart';

class RatingService {
  RatingService({
    required this.repository,
  });

  final RatingRepositoryInterface repository;

  Future<void> sendRating({required double rating, required String quizId}) async {
    await repository.sendRating(rating: rating, quizId: quizId);
  }

  Future<bool> wasAlreadyRated({required String quizId}) async {
    return await repository.wasAlreadyRated(quizId: quizId);
  }
}

@riverpod
RatingService ratingService(RatingServiceRef ref) {
  RatingRepositoryInterface repository = ref.watch(ratingRepositoryProvider);
  return RatingService(repository: repository);
}
