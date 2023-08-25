import 'package:flutterquiz/src/domain/models/quiz.dart';
import 'package:flutterquiz/src/domain/use_cases/quiz.use_case.dart';
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
    return await ref.read(quizUseCaseProvider.notifier).getQuizzes();
  }
}
