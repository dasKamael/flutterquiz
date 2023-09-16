import 'package:flutterquiz/src/data/repository/quiz.repository.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_edit_quiz.service.g.dart';

@riverpod
class CreateEditQuizService extends _$CreateEditQuizService {
  @override
  build() {}

  Future<Quiz> createQuiz({required Quiz quiz}) async {
    return await ref.read(quizRepositoryProvider).createQuiz(quiz: quiz);
  }

  Future<void> createUpdateQuestionWithAnswers({required Question question}) async {
    await ref.read(quizRepositoryProvider).createUpdateQuestionWithAnswers(question: question);
  }
}
