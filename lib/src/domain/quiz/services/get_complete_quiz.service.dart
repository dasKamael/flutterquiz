import 'package:flutterquiz/src/data/repository/quiz.repository.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_complete_quiz.service.g.dart';

@riverpod
class GetCompleteQuiz extends _$GetCompleteQuiz {
  @override
  FutureOr<Quiz> build({required String quizId}) async {
    return await getCompleteQuizById(quizId: quizId);
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
}
