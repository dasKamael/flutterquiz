import 'package:flutterquiz/src/data/quiz/quiz.repository.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_answers.service.g.dart';

@riverpod
class GetAnswersService extends _$GetAnswersService {
  @override
  FutureOr<List<Answer>> build({required String questionId}) async {
    return await ref.read(quizRepositoryProvider).getAnswersByQuestionId(questionId);
  }
}
