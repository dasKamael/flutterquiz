import 'package:flutterquiz/src/data/mapper/quiz.mapper.dart';
import 'package:flutterquiz/src/data/quiz/data_source/api/dto/answer_response.dto.dart';
import 'package:flutterquiz/src/data/quiz/data_source/api/dto/question_response.dto.dart';
import 'package:flutterquiz/src/data/quiz/data_source/api/dto/quiz_response.dto.dart';
import 'package:flutterquiz/src/data/quiz/data_source/api/quiz.api.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/domain/quiz/repository/quiz.repository_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz.repository.g.dart';

class QuizRepository implements QuizRepositoryInterface {
  final QuizApi quizApi;

  QuizRepository({
    required this.quizApi,
  });

  // Quizzes #################################################################
  @override
  Future<List<Quiz>> getQuizzes() async {
    List<QuizResponseDto> quizzesMap = await quizApi.getQuizzes();
    List<Quiz> quizzes = [];
    for (QuizResponseDto quiz in quizzesMap) {
      quizzes.add(QuizMapper().toModel(quiz));
    }
    return quizzes;
  }

  @override
  Future<List<Quiz>> getQuizzesByUserId({required String userId}) async {
    List<QuizResponseDto> quizzesMap = await quizApi.getQuizzesByUserId(userId: userId);
    List<Quiz> quizzes = [];
    for (QuizResponseDto quiz in quizzesMap) {
      quizzes.add(QuizMapper().toModel(quiz));
    }
    return quizzes;
  }

  @override
  Future<Quiz> getQuizById({required String quizId}) async {
    QuizResponseDto? quiz = await quizApi.getQuizById(quizId: quizId);
    return QuizMapper().toModel(quiz!);
  }

  @override
  Future<Quiz> createOrUpdateQuiz({required Quiz quiz}) async {
    QuizResponseDto? data = await quizApi.createOrUpdateQuiz(quiz: quiz);
    return QuizMapper().toModel(data!);
  }

  @override
  Future<void> increamentQuizPassedCount({required String quizId}) async {
    await quizApi.increamentQuizPassedCount(quizId: quizId);
  }

  // Questions ###############################################################
  @override
  Future<Question> getQuestionById(String questionId) async {
    QuestionResponseDto? question = await quizApi.getQuestionById(questionId: questionId);
    return QuestionMapper().toModel(question!);
  }

  @override
  Future<List<Question>> getQuestionsByQuizId(String quizId) async {
    List<QuestionResponseDto> questionsMap = await quizApi.getQuestionsByQuizId(quizId: quizId);
    List<Question> questions = [];
    for (QuestionResponseDto question in questionsMap) {
      questions.add(QuestionMapper().toModel(question));
    }
    return questions;
  }

  @override
  Future<Question> createOrUpdateQuestion({required Question question}) async {
    QuestionResponseDto? data = await quizApi.createOrUpdateQuestion(question: question);
    return QuestionMapper().toModel(data!);
  }

  // Answers #################################################################
  @override
  Future<List<Answer>> getAnswersByQuestionId(String questionId) async {
    List<AnswerResponseDto> answersMap = await quizApi.getAnswersByQuestionId(questionId: questionId);
    List<Answer> answers = [];
    for (AnswerResponseDto answer in answersMap) {
      answers.add(AnswerMapper().toModel(answer));
    }
    return answers;
  }

  @override
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
