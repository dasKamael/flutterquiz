import 'package:flutterquiz/src/domain/quiz/enums/question_type.enum.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/domain/quiz/services/create_edit_quiz.service.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_complete_quiz.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_quiz.controller.g.dart';

@riverpod
class EditQuizController extends _$EditQuizController {
  @override
  FutureOr<Quiz> build({String? quizId}) async {
    // When id == null create quiz to get id for use
    Quiz quiz;
    if (quizId == null) {
      quiz = await ref.read(createEditQuizServiceProvider.notifier).createQuiz(
            quiz: Quiz(
              id: '',
              title: '',
              createdBy: '',
              createdAt: DateTime.now(),
              isPrivate: true,
            ),
          );
    } else {
      quiz = await ref.read(getCompleteQuizProvider(quizId: quizId).future);
    }

    return quiz;
  }

  void addQuestion({required QuestionType questionType}) {
    state = AsyncValue.data(
      state.value!.copyWith(
        questions: [
          ...state.value!.questions!,
          Question(
            id: '',
            quizId: state.value?.id ?? '',
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

  void addAnswerToQuestion({required Question question}) {
    // TODO Implement
  }

  void ediitIsAnswerCorrect({required int questionIndex, required int answerIndex, required bool value}) {
    Question question = state.value!.questions![questionIndex];
    Answer answer = question.answers![answerIndex];
    answer = answer.copyWith(isCorrect: value);
    question.answers![answerIndex] = answer;
    state.value!.questions![questionIndex] = question;
  }
}
