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
          id: '',
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
    log(state.questions!.length.toString());
  }

  void updateQuestion({required Question question}) {
    List<Question> temp = state.questions!.toList();
    temp[temp.indexWhere((element) => element.id == question.id)] = question;
    state = state.copyWith(questions: temp);
  }

  void removeQuestion({required int index}) {
    List<Question> temp = state.questions!.toList();
    temp.removeAt(index);
    state = state.copyWith(questions: temp);
  }

  // Answer related ####################################################################################################

  void editIsAnswerCorrect({required int questionIndex, required int answerIndex, required bool value}) {
    Question question = state.questions![questionIndex];
    Answer answer = question.answers![answerIndex];
    answer = answer.copyWith(isCorrect: value);
    question.answers![answerIndex] = answer;
    state.questions![questionIndex] = question;
  }

  Future<(bool, String?)> saveQuiz() async {
    try {
      if (state.id!.isEmpty) {
        Quiz newQuiz = await ref.read(createEditQuizServiceProvider.notifier).createQuiz(quiz: state);
        state = newQuiz.copyWith(questions: state.questions);
      }
      for (Question question in state.questions!) {
        await ref.read(createEditQuizServiceProvider.notifier).createUpdateQuestionWithAnswers(question: question);
      }
      return (true, null);
    } catch (e, s) {
      _logger.info('SaveQuiz error: $e, $s');
      return (false, e.toString());
    }
  }
}
