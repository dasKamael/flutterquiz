import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';

abstract interface class QuizRepositoryInterface {
  // Quizzes #################################################################
  Future<List<Quiz>> getQuizzes();
  Future<List<Quiz>> getQuizzesByUserId({required String userId});
  Future<Quiz> getQuizById({required String quizId});
  Future<Quiz> createOrUpdateQuiz({required Quiz quiz});
  Future<void> increamentQuizPassedCount({required String quizId});
  // Questions ###############################################################
  Future<Question> getQuestionById(String questionId);
  Future<List<Question>> getQuestionsByQuizId(String quizId);
  Future<Question> createOrUpdateQuestion({required Question question});
  Future<void> deleteAnswerWithId({required String answerId});
  // Answers #################################################################
  Future<List<Answer>> getAnswersByQuestionId(String questionId);
  Future<void> createOrUpdateAnswer({required Answer answer});
  Future<void> deleteQuestionWithId({required String questionId});
}
