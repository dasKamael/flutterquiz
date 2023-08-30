import 'package:flutterquiz/src/data/repository/quiz.repository.dart';
import 'package:flutterquiz/src/domain/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz.services.g.dart';

@riverpod
class QuizService extends _$QuizService {
  @override
  build() {}

  // Quizzes #################################################################
  Future<List<Quiz>> getQuizzes() async {
    return await ref.read(quizRepositoryProvider).getQuizzes();
  }

  Future<Quiz> getCompleteQuizById({required String quizId}) async {
    Quiz quiz = await ref.read(quizRepositoryProvider).getQuizById(quizId: quizId);

    final List<Question> questions = await ref.read(quizRepositoryProvider).getQuestionsByQuizId(quiz.id);
    List<Question> questionsWithAnswers = [];

    for (Question question in questions) {
      final List<Answer> answers = await ref.read(quizRepositoryProvider).getAnswersByQuestionId(question.id);
      question = question.copyWith(answers: answers);
      questionsWithAnswers.add(question);
    }

    quiz = quiz.copyWith(questions: questionsWithAnswers);

    return quiz;
  }

  // Questions ###############################################################
  Future<List<Question>> getQuestionsByQuizId({required String quizId}) async {
    return await ref.read(quizRepositoryProvider).getQuestionsByQuizId(quizId);
  }

  Future<Question> getQuestionById({required String questionId}) async {
    return await ref.read(quizRepositoryProvider).getQuestionById(questionId);
  }

  // Answers #################################################################
  Future<List<Answer>> getAnswersByQuestionId({required String questionId}) {
    return ref.read(quizRepositoryProvider).getAnswersByQuestionId(questionId);
  }
}