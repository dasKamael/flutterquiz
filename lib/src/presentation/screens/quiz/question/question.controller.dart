import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_quizzes.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question.controller.g.dart';

@riverpod
class QuestionController extends _$QuestionController {
  @override
  FutureOr<Question> build({required quizId, required questionId}) async {
    final Question question = await getCompleteQuestionById();
    return question;
  }

  Future<Question> getCompleteQuestionById() async {
    Question question = await ref.read(getQuizzesServiceProvider.notifier).getQuestionById(questionId: questionId);

    final List<Answer> answers =
        await ref.read(getQuizzesServiceProvider.notifier).getAnswersByQuestionId(questionId: question.id);

    question = question.copyWith(answers: answers);

    return question;
  }
}
