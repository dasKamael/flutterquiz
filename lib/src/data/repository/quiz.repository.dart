import 'package:flutterquiz/src/data/api/quiz.api.dart';
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

  Future<List<Quiz>> getQuizzesByUserId({required String userId}) async {
    List quizzesMap = await quizApi.getQuizzesByUserId(userId: userId);
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

  Future<Quiz> createOrUpdateQuiz({required Quiz quiz}) async {
    Map<String, dynamic> data = await quizApi.createOrUpdateQuiz(quiz: quiz);
    return QuizMapper().toModel(data);
  }

  Future<void> increamentQuizPassedCount({required String quizId}) async {
    await quizApi.increamentQuizPassedCount(quizId: quizId);
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

  Future<Question> createOrUpdateQuestion({required Question question}) async {
    Map<String, dynamic> data = await quizApi.createOrUpdateQuestion(question: question);
    return QuestionMapper().toModel(data);
  }

  // Answers #################################################################
  Future<List<Answer>> getAnswersByQuestionId(String questionId) async {
    List answersMap = await quizApi.getAnswersByQuestionId(questionId: questionId);
    List<Answer> answers = [];
    for (Map answer in answersMap) {
      answers.add(AnswerMapper().toModel(answer));
    }
    return answers;
  }

  // Future<void> createUpdateQuestionWithAnswers({required Question question}) async {
  //   await quizApi.createUpdateQuestionWithAnswers(question: question);
  // }

  Future<void> createOrUpdateAnswer({required Answer answer}) async {
    await quizApi.createOrUpdateAnswer(answer: answer);
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
