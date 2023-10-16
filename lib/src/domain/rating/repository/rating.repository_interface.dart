abstract class RatingRepositoryInterface {
  Future<void> sendRating({required double rating, required String quizId});
  Future<bool> wasAlreadyRated({required String quizId});
}
