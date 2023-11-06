import 'package:flutter/material.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/features/quiz/question/widgets/multiple_answer_question.dart';
import 'package:flutterquiz/src/presentation/features/quiz/question/widgets/single_answer_question.dart';

class QuestionUtil {
  static Widget getQuestionWidgetByType(String questionType, Question question) {
    switch (questionType) {
      case 'single':
        return SingleAnswerQuestion(question: question);
      case 'multiple':
        return MultipleAnswerQuestion(question: question);
      default:
        return SingleAnswerQuestion(question: question);
      // return const UiAppError(
      //   error: 'No Questiontype found',
      // );
    }
  }
}
