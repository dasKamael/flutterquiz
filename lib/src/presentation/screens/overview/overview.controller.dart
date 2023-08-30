import 'package:flutterquiz/src/domain/quiz/services/quiz.services.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'overview.controller.g.dart';

@riverpod
class OverviewController extends _$OverviewController {
  @override
  FutureOr<List<Quiz>> build() async {
    List<Quiz> quizzes = await fetchQuizzes();
    return quizzes;
  }

  Future<List<Quiz>> fetchQuizzes() async {
    return ref.read(quizServiceProvider).value ?? [];
  }
}
