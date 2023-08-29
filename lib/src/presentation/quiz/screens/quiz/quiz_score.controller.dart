import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_score.controller.g.dart';

@Riverpod(keepAlive: true)
class QuizScoreController extends _$QuizScoreController {
  @override
  int build() {
    return 0;
  }

  void incrementBy({required int value}) {
    state += value;
  }

  void reset() {
    state = 0;
  }
}
