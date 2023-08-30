import 'package:flutterquiz/src/data/repository/quiz.repository.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_quizzes.service.g.dart';

@riverpod
class GetQuizzesService extends _$GetQuizzesService {
  @override
  Future<List<Quiz>> build() async {
    return await ref.read(quizRepositoryProvider).getQuizzes();
  }
}
