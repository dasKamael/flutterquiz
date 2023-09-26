import 'package:flutterquiz/src/data/repository/quiz.repository.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_edit_quiz.service.g.dart';

class CreateEditQuizService {
  CreateEditQuizService({required this.quizRepositoryProvider});

  final QuizRepository quizRepositoryProvider;

  Future<Quiz> createQuiz({required Quiz quiz}) async {
    return await quizRepositoryProvider.createQuiz(quiz: quiz);
  }

  Future<void> createUpdateQuestionWithAnswers({required Question question}) async {
    await quizRepositoryProvider.createUpdateQuestionWithAnswers(question: question);
  }

  Future<void> increamentQuizPassedCount({required String quizId}) async {
    await quizRepositoryProvider.increamentQuizPassedCount(quizId: quizId);
  }
}

/// Providers
@riverpod
CreateEditQuizService createEditQuizService(CreateEditQuizServiceRef ref) {
  final repository = ref.read(quizRepositoryProvider);
  return CreateEditQuizService(quizRepositoryProvider: repository);
}
