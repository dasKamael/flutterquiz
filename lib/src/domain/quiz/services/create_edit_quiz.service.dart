import 'package:flutterquiz/src/data/quiz/quiz.repository.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_edit_quiz.service.g.dart';

class CreateEditQuizService {
  CreateEditQuizService({required this.quizRepositoryProvider});

  final QuizRepository quizRepositoryProvider;

  // Quizzes #################################################################

  Future<Quiz> createOrUpdateQuiz({required Quiz quiz}) async {
    return await quizRepositoryProvider.createOrUpdateQuiz(quiz: quiz);
  }

  Future<void> increamentQuizPassedCount({required String quizId}) async {
    await quizRepositoryProvider.increamentQuizPassedCount(quizId: quizId);
  }

  // Questions ###############################################################

  Future<void> createOrUpdateQuestionWithAnswers({required Question question}) async {
    Question upsertedQuestion = await quizRepositoryProvider.createOrUpdateQuestion(question: question);

    for (Answer answer in question.answers!) {
      answer = answer.copyWith(questionId: upsertedQuestion.id);
      await createOrUpdateAnswer(answer: answer);
    }
  }

  // Answers #################################################################

  Future<void> createOrUpdateAnswer({required Answer answer}) async {
    await quizRepositoryProvider.createOrUpdateAnswer(answer: answer);
  }
}

/// Providers
@riverpod
CreateEditQuizService createEditQuizService(CreateEditQuizServiceRef ref) {
  final repository = ref.read(quizRepositoryProvider);
  return CreateEditQuizService(quizRepositoryProvider: repository);
}
