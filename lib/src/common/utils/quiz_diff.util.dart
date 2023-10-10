import 'package:collection/collection.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';

class QuizDiff {
  final List<Question> removedQuestions;
  final List<Answer> removedAnswers;

  QuizDiff({required this.removedQuestions, required this.removedAnswers});
}

QuizDiff findDifferences(Quiz oldQuiz, Quiz newQuiz) {
  final removedQuestions = <Question>[];
  final removedAnswers = <Answer>[];

  // Identify removed questions
  for (final oldQuestion in oldQuiz.questions!) {
    if (!newQuiz.questions!.any((q) => q.id == oldQuestion.id)) {
      removedQuestions.add(oldQuestion);
    }
  }

  // Identify removed answers
  for (final oldQuestion in oldQuiz.questions!) {
    Question? newQuestion = newQuiz.questions!.firstWhereOrNull((q) => q.id == oldQuestion.id);
    if (newQuestion != null) {
      for (final oldAnswer in oldQuestion.answers!) {
        // If the old answer id is not in the new answers, it was removed
        if (!newQuestion.answers!.any((a) => a.id == oldAnswer.id)) {
          removedAnswers.add(oldAnswer);
        }
      }
    }
  }

  return QuizDiff(removedQuestions: removedQuestions, removedAnswers: removedAnswers);
}
