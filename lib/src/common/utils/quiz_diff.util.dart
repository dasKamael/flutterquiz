import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';

class QuizDiff {
  final List<Question> removedQuestions;
  final Map<Question, List<Answer>> removedAnswers;

  QuizDiff({required this.removedQuestions, required this.removedAnswers});
}

QuizDiff findDifferences(Quiz oldQuiz, Quiz newQuiz) {
  final removedQuestions = <Question>[];
  final removedAnswers = <Question, List<Answer>>{};

  // Check for removed questions
  for (final oldQuestion in oldQuiz.questions!) {
    if (!newQuiz.questions!.contains(oldQuestion)) {
      removedQuestions.add(oldQuestion);
    }
  }

  // Check for removed answers
  for (final newQuestion in newQuiz.questions!) {
    final oldQuestion = oldQuiz.questions!.firstWhere((q) => q.id == newQuestion.id);
    final removedAnswersForQuestion = oldQuestion.answers!.where((a) => !newQuestion.answers!.contains(a)).toList();
    if (removedAnswersForQuestion.isNotEmpty) {
      removedAnswers[oldQuestion] = removedAnswersForQuestion;
    }
  }

  return QuizDiff(removedQuestions: removedQuestions, removedAnswers: removedAnswers);
}
