import 'dart:developer';

import 'package:flutterquiz/src/domain/quiz/enums/question_type.enum.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/domain/quiz/services/create_edit_quiz.service.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_quiz.controller.g.dart';

@riverpod
class EditQuizController extends _$EditQuizController {
  Logger get _logger => Logger('EditQuizController');

  @override
  Quiz build({required Quiz quiz}) {
    return quiz;
  }

  // Quiz related ######################################################################################################

  updateQuizTitle(String value) {
    state = state.copyWith(title: value);
  }

  updateQuizDescription(String value) {
    state = state.copyWith(description: value);
  }

  void toggleIsPrivate(bool value) {
    state = state.copyWith(isPrivate: value);
  }

  // Question related ##################################################################################################

  void addQuestion({required QuestionType questionType}) {
    state = state.copyWith(
      questions: [
        ...state.questions ?? [],
        Question(
          id: state.questions!.length.toString(),
          quizId: state.id ?? '',
          question: '',
          answers: [],
          explanation: '',
          explanationLink: '',
          createdAt: DateTime.now(),
          type: questionType.name,
        ),
      ],
    );
  }

  void updateQuestion({required Question question}) {
    List<Question> temp = state.questions!.toList();
    temp[temp.indexWhere((element) => element.id == question.id)] = question;
    state = state.copyWith(questions: temp);
    log(temp.toString());
    log(state.questions.toString());
  }

  void removeQuestion({required int index}) {
    List<Question> temp = state.questions!.toList();
    Question removedQuestion = temp.removeAt(index);
    // TODO - Delete Question with Answers from DB
    if (removedQuestion.id != '') {
      // ref.read(createEditQuizServiceProvider).deleteQuestionWithAnswers(questionId: removedQuestion.id);
    }
    state = state.copyWith(questions: temp);
  }

  // Common ############################################################################################################

  Future<(bool, String?)> saveQuiz() async {
    log(state.questions.toString());
    try {
      Quiz newQuiz = await ref.read(createEditQuizServiceProvider).createOrUpdateQuiz(quiz: state);
      List<Question> tempQuestions = state.questions!;
      state = newQuiz.copyWith(questions: tempQuestions);
      for (Question question in state.questions!) {
        await ref.read(createEditQuizServiceProvider).createOrUpdateQuestionWithAnswers(question: question);
      }
      return (true, null);
    } catch (e, s) {
      _logger.info('SaveQuiz error: $e, $s');
      return (false, e.toString());
    }
  }
}
