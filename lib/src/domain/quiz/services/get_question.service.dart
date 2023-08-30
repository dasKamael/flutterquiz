import 'package:flutterquiz/src/data/repository/quiz.repository.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_question.service.g.dart';

@riverpod
class GetQuestionService extends _$GetQuestionService {
  @override
  FutureOr<Question> build({required questionId}) async {
    return await ref.read(quizRepositoryProvider).getQuestionById(questionId);
  }
}
