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
    if (quizId == null) {
      return Quiz(
        id: '',
        title: '',
        description: '',
        createdBy: '',
        createdAt: DateTime.now(),
        isPrivate: true,
        questions: [],
      );
    }
    return await ref.read(getCompleteQuizProvider(quizId: quizId).future);
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

  void toggleIsPrivate(bool value) {
    state = AsyncValue.data(
      state.value!.copyWith(isPrivate: value),
    );
  }

  void updateQuestion({required Question question}) {
    List<Question> temp = state.value!.questions!.toList();
    temp[temp.indexWhere((element) => element.id == question.id)] = question;
    state = AsyncValue.data(
      state.value!.copyWith(questions: temp),
    );
  }

  void editIsAnswerCorrect({required int questionIndex, required int answerIndex, required bool value}) {
    Question question = state.value!.questions![questionIndex];
    Answer answer = question.answers![answerIndex];
    answer = answer.copyWith(isCorrect: value);
    question.answers![answerIndex] = answer;
    state.value!.questions![questionIndex] = question;
  }

  void removeQuestion({required int index}) {
    List<Question> temp = state.value!.questions!.toList();
    temp.removeAt(index);
    state = AsyncValue.data(
      state.value!.copyWith(questions: temp),
    );
  }

  Future<(bool, String?)> saveQuiz() async {
    try {
      await ref.read(createEditQuizServiceProvider.notifier).createQuiz(quiz: state.value!);
      return (true, null);
    } catch (e) {
      return (false, e.toString());
    }
  }
}
