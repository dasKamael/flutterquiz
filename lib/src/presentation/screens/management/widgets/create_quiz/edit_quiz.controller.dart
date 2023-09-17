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

  void addQuestion({required QuestionType questionType}) {
    try {
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
    } catch (e) {
      _logger.info('AddQuestion error: $e');
    }
  }

  void toggleIsPrivate(bool value) {
    state = state.copyWith(isPrivate: value);
  }

  void updateQuestion({required Question question}) {
    List<Question> temp = state.questions!.toList();
    temp[temp.indexWhere((element) => element.id == question.id)] = question;
    state = state.copyWith(questions: temp);
  }

  void editIsAnswerCorrect({required int questionIndex, required int answerIndex, required bool value}) {
    Question question = state.questions![questionIndex];
    Answer answer = question.answers![answerIndex];
    answer = answer.copyWith(isCorrect: value);
    question.answers![answerIndex] = answer;
    state.questions![questionIndex] = question;
  }

  void removeQuestion({required int index}) {
    List<Question> temp = state.questions!.toList();
    temp.removeAt(index);
    state = state.copyWith(questions: temp);
  }

  Future<(bool, String?)> saveQuiz() async {
    try {
      if (state.title.isEmpty) {
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
