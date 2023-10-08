import 'dart:developer';

import 'package:flutterquiz/src/domain/quiz/enums/question_type.enum.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/domain/quiz/services/create_edit_quiz.service.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_complete_quiz.service.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_quiz.controller.g.dart';

@Riverpod(keepAlive: true)
class EditQuizController extends _$EditQuizController {
  Logger get _logger => Logger('EditQuizController');

  late final Quiz _oldQuiz;

  @override
  FutureOr<Quiz> build(String? quizId) async {
    final Quiz quiz = await ref.read(getCompleteQuizProvider(quizId: quizId).future);
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
    Question removedQuestion = temp.removeAt(index);
    // TODO - Delete Question with Answers from DB
    if (removedQuestion.id != '') {
      // ref.read(createEditQuizServiceProvider).deleteQuestionWithAnswers(questionId: removedQuestion.id);
    }
    state = AsyncValue.data(state.value!.copyWith(questions: temp));
  }

  // Common ############################################################################################################

  Future<(bool, String?)> saveQuiz() async {
    // Compare _oldQuiz with state.value! and save questions and answers that are different inside lists

    try {
      log(state.value!.questions!.first.question.toString());
      Quiz newQuiz = await ref.read(createEditQuizServiceProvider).createOrUpdateQuiz(quiz: state.value!);
      List<Question> tempQuestions = state.value!.questions!;
      state = AsyncValue.data(newQuiz.copyWith(questions: tempQuestions));

      for (Question question in state.value!.questions!) {
        log(question.answers.toString());
        await ref.read(createEditQuizServiceProvider).createOrUpdateQuestionWithAnswers(question: question);
      }
      log(state.value!.questions!.first.question.toString());
      return (true, null);
    } catch (e, s) {
      _logger.info('SaveQuiz error: $e, $s');
      return (false, e.toString());
    }
  }
}
