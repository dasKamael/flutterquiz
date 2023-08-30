import 'package:flutterquiz/src/domain/models/quiz.dart';
import 'package:flutterquiz/src/domain/services/quiz.services.dart';
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
    Question question = await ref.read(quizServiceProvider.notifier).getQuestionById(questionId: questionId);

    final List<Answer> answers =
        await ref.read(quizServiceProvider.notifier).getAnswersByQuestionId(questionId: question.id);

    question = question.copyWith(answers: answers);

    return question;
  }
}
