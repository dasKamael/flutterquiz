import 'dart:developer';

import 'package:flutterquiz/src/common/utils/quiz_diff.util.dart';
import 'package:flutterquiz/src/domain/authentication/services/auth.service.dart';
import 'package:flutterquiz/src/domain/management/services/create_edit_quiz.service.dart';
import 'package:flutterquiz/src/domain/quiz/enums/question_type.enum.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_complete_quiz.service.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_quizzes_by_user_id.service.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_quiz.controller.g.dart';

@riverpod
class EditQuizController extends _$EditQuizController {
  Logger get _logger => Logger('EditQuizController');

  late final Quiz _oldQuiz;

  @override
  FutureOr<Quiz> build(String? quizId) async {
    if (quizId == null || quizId == '') {
      return Quiz(
        id: '',
        title: '',
        description: '',
        createdBy: '',
        rating: 0,
        userRatedCount: 0,
        createdAt: DateTime.now(),
        isPrivate: false,
        questions: [],
      );
    }
    final Quiz quiz = await ref.read(getCompleteQuizProvider(quizId: quizId).future);
    log(quiz.toString());
    _oldQuiz = quiz;
    return quiz;
  }

  // Quiz related ######################################################################################################

  void updateQuizTitle(String value) {
    state = AsyncValue.data(state.value!.copyWith(title: value));
  }

  void updateQuizDescription(String value) {
    state = AsyncValue.data(state.value!.copyWith(description: value));
  }

  void toggleIsPrivate(bool value) {
    state = AsyncValue.data(state.value!.copyWith(isPrivate: value));
  }

  // Question related ##################################################################################################

  void addQuestion({required QuestionType questionType}) {
    state = AsyncValue.data(
      state.value!.copyWith(
        questions: [
          ...state.value!.questions ?? [],
          Question(
            id: state.value!.questions!.length.toString(),
            quizId: state.value!.id ?? '',
            question: '',
            answers: [],
            explanation: '',
            explanationLink: '',
            createdAt: DateTime.now(),
            type: questionType.name,
          ),
        ],
      ),
    );
  }

  void updateQuestion({required Question question}) {
    List<Question> temp = state.value!.questions!.toList();
    temp[temp.indexWhere((element) => element.id == question.id)] = question;
    state = AsyncValue.data(state.value!.copyWith(questions: temp));
  }

  void removeQuestion({required int index}) {
    List<Question> temp = state.value!.questions!.toList();
    temp.removeAt(index);
    state = AsyncValue.data(state.value!.copyWith(questions: temp));
  }

  // Common ############################################################################################################

  Future<(bool, String?)> saveQuiz() async {
    if (state.value!.questions!.isEmpty) {
      state = AsyncValue.data(state.value!.copyWith(isPrivate: true));
      return (false, 'no_questions');
    }
    state = const AsyncValue.loading();

    Quiz tempQuiz = state.value!;

    try {
      Quiz newQuiz = await ref.read(createEditQuizServiceProvider).createOrUpdateQuiz(quiz: state.value!);

      for (Question question in state.value!.questions!) {
        question = question.copyWith(quizId: newQuiz.id!);
        await ref.read(createEditQuizServiceProvider).createOrUpdateQuestionWithAnswers(question: question);
      }

      if (tempQuiz.id != '') {
        QuizDiff diff = findDifferences(_oldQuiz, state.value!);
        for (Question question in diff.removedQuestions) {
          await ref.read(createEditQuizServiceProvider).deleteQuestionWithId(questionId: question.id);
        }

        for (Answer answer in diff.removedAnswers) {
          await ref.read(createEditQuizServiceProvider).deleteAnswerWithId(answerId: answer.id);
        }
      }
      state = AsyncValue.data(tempQuiz);

      ref.read(getQuizzesByUserIdServiceProvider(userId: ref.read(authServiceProvider)!.id).notifier).invalidate();

      return (true, null);
    } catch (e, s) {
      _logger.info('SaveQuiz error: $e, $s');
      state = AsyncValue.data(tempQuiz);
      return (false, e.toString());
    }
  }
}
