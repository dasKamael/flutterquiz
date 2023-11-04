import 'package:flutterquiz/src/common/utils/quiz_diff.util.dart';
import 'package:flutterquiz/src/data/quiz/quiz.repository.dart';
import 'package:flutterquiz/src/domain/authentication/services/auth.service.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/domain/quiz/repository/quiz.repository_interface.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_quizzes_by_user_id.service.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_edit_quiz.service.g.dart';

class CreateEditQuizService {
  CreateEditQuizService({required this.quizRepositoryProvider, required this.ref});
  Logger get _logger => Logger('CreateEditQuizService');

  final CreateEditQuizServiceRef ref;
  final QuizRepositoryInterface quizRepositoryProvider;

  // Quizzes #################################################################

  Future<(bool, String?)> saveQuiz({required Quiz quiz, required Quiz oldQuiz}) async {
    try {
      Quiz newQuiz = await createOrUpdateQuiz(quiz: quiz);

      for (Question question in quiz.questions!) {
        question = question.copyWith(quizId: newQuiz.id!);
        await createOrUpdateQuestionWithAnswers(question: question);
      }

      if (quiz.id != '') {
        QuizDiff diff = findDifferences(oldQuiz, quiz);
        for (Question question in diff.removedQuestions) {
          await deleteQuestionWithId(questionId: question.id);
        }

        for (Answer answer in diff.removedAnswers) {
          await deleteAnswerWithId(answerId: answer.id);
        }
      }

      ref.read(getQuizzesByUserIdServiceProvider(userId: ref.read(authServiceProvider)!.id).notifier).invalidate();

      return (true, null);
    } catch (e, s) {
      _logger.info('SaveQuiz error: $e, $s');
      return (false, e.toString());
    }
  }

  Future<Quiz> createOrUpdateQuiz({required Quiz quiz}) async {
    return await quizRepositoryProvider.createOrUpdateQuiz(quiz: quiz);
  }

  Future<void> incrementQuizCompletedCount({required String quizId}) async {
    await quizRepositoryProvider.incrementQuizCompletedCount(quizId: quizId);
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

  Future<void> deleteQuestionWithId({required String questionId}) async {
    await quizRepositoryProvider.deleteQuestionWithId(questionId: questionId);
  }

  Future<void> deleteAnswerWithId({required String answerId}) async {
    await quizRepositoryProvider.deleteAnswerWithId(answerId: answerId);
  }

  Future<void> deleteQuizWithId({String? quizId}) async {
    await quizRepositoryProvider.deleteQuizWithId(quizId: quizId);
  }
}

/// Providers
@riverpod
CreateEditQuizService createEditQuizService(CreateEditQuizServiceRef ref) {
  final QuizRepositoryInterface repository = ref.read(quizRepositoryProvider);
  return CreateEditQuizService(
    ref: ref,
    quizRepositoryProvider: repository,
  );
}
