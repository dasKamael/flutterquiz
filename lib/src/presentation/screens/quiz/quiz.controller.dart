import 'package:flutterquiz/src/domain/quiz/services/quiz.services.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz.controller.g.dart';

@Riverpod(keepAlive: true)
class QuizController extends _$QuizController {
  @override
  FutureOr<Quiz> build({required String quizId}) async {
    final Quiz quiz = await fetchCompleteQuiz();
    return quiz;
  }

  int score = 0;

  Future<Quiz> fetchCompleteQuiz() async {
    state = const AsyncValue.loading();
    return await ref.read(quizServiceProvider.notifier).getCompleteQuizById(quizId: quizId);
  }
}
