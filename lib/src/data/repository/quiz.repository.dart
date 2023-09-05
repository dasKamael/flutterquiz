import 'package:flutterquiz/src/data/data_source/api/quiz.api.dart';
import 'package:flutterquiz/src/data/mapper/quiz.mapper.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz.repository.g.dart';

class QuizRepository {
  final QuizApi quizApi;

  QuizRepository({
    required this.quizApi,
  });

  // Quizzes #################################################################
  Future<List<Quiz>> getQuizzes() async {
    List quizzesMap = await quizApi.getQuizzes();
    List<Quiz> quizzes = [];
    for (Map quiz in quizzesMap) {
      quizzes.add(QuizMapper().toModel(quiz));
    }
    return quizzes;
  }

  Future<Quiz> getQuizById({required String quizId}) async {
    Map<String, dynamic> quiz = await quizApi.getQuizById(quizId: quizId);
    return QuizMapper().toModel(quiz);
  }

  Future<Quiz> createQuiz({required Quiz quiz}) async {
    Map<String, dynamic> data = await quizApi.createQuiz(quiz: quiz);
    return QuizMapper().toModel(data);
  }

  // Questions ###############################################################
  Future<Question> getQuestionById(String questionId) async {
    Map<String, dynamic> question = await quizApi.getQuestionById(questionId: questionId);
    return QuestionMapper().toModel(question);
  }

  Future<List<Question>> getQuestionsByQuizId(String quizId) async {
    List questionsMap = await quizApi.getQuestionsByQuizId(quizId: quizId);
    List<Question> questions = [];
    for (Map question in questionsMap) {
      questions.add(QuestionMapper().toModel(question));
    }
    return questions;
  }

  // Answers #################################################################
  Future<List<Answer>> getAnswersByQuestionId(String questionId) async {
    List answersMap = await quizApi.getAnswersByQuestionId(questionId: questionId);
    List<Answer> questions = [];
    for (Map answer in answersMap) {
      questions.add(AnswerMapper().toModel(answer));
    }
    return questions;
  }
}

/// Providers
@riverpod
QuizRepository quizRepository(QuizRepositoryRef ref) {
  final quizApi = ref.watch(quizApiProvider);
  return QuizRepository(
    quizApi: quizApi,
  );
}
