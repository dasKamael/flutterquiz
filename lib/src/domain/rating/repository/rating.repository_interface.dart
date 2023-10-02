abstract class RatingRepositoryInterface {
  Future<void> sendRating({required double rating, required String quizId});
}
