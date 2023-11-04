import 'dart:developer';

import 'package:flutterquiz/src/domain/management/services/create_edit_quiz.service.dart';
import 'package:flutterquiz/src/domain/quiz/enums/question_type.enum.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_complete_quiz.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_quiz.controller.g.dart';

@riverpod
class EditQuizController extends _$EditQuizController {
  late final Quiz _oldQuiz;

  @override
  FutureOr<Quiz> build(String? quizId) async {
    if (quizId == null || quizId == '') {
      return Quiz(
        id: '',
        title: '',
        description: '',
        createdBy: '',
        rating: 0,
        userRatedCount: 0,
        createdAt: DateTime.now(),
        isPrivate: false,
        questions: [],
      );
    }
    final Quiz quiz = await ref.read(getCompleteQuizProvider(quizId: quizId).future);
    log(quiz.toString());
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
    temp.removeAt(index);
    state = AsyncValue.data(state.value!.copyWith(questions: temp));
  }

  // Common ############################################################################################################

  Future<(bool, String?)> saveQuiz() async {
    if (state.value!.questions!.isEmpty) {
      state = AsyncValue.data(state.value!.copyWith(isPrivate: true));
      return (false, 'no_questions');
    }
    state = const AsyncValue.loading();
    return await ref.read(createEditQuizServiceProvider).saveQuiz(quiz: state.value!, oldQuiz: _oldQuiz);
  }
}
