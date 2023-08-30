import 'package:flutter/material.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/screens/quiz/question/widgets/multiple_answer_question.dart';
import 'package:flutterquiz/src/presentation/screens/quiz/question/widgets/single_answer_question.dart';

class QuestionUtil {
  static Widget getQuestionType(String questionType, Question question) {
    switch (questionType) {
      case 'single':
        return SingleAnswerQuestion(question: question);
      case 'multiple':
        return MultipleAnswerQuestion(question: question);
      default:
        return SingleAnswerQuestion(question: question);
      // return const AppError(
      //   error: 'No Questiontype found',
      // );
    }
  }
}
