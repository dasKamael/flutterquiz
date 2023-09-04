import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_complete_quiz.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_quiz.controller.g.dart';

@riverpod
class EditQuizController extends _$EditQuizController {
  @override
  FutureOr<Quiz> build({String? quizId}) async {
    Quiz quiz = Quiz(
      id: '',
      title: '',
      createdBy: '',
      createdAt: DateTime.now(),
      isPrivate: true,
      questions: [],
    );

    if (quizId != null) {
      quiz = await ref.read(getCompleteQuizProvider(quizId: quizId).future);
    }

    return quiz;
  }
}
