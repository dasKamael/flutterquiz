import 'package:flutterquiz/src/data/quiz/quiz.repository.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_quizzes_by_user_id.service.g.dart';

@riverpod
class GetQuizzesByUserIdService extends _$GetQuizzesByUserIdService {
  @override
  Future<List<Quiz>> build({required String userId}) async {
    return await ref.read(quizRepositoryProvider).getQuizzesByUserId(userId: userId);
  }

  invalidate() {
    ref.invalidateSelf();
  }
}
