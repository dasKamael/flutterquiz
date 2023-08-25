import 'package:flutterquiz/src/domain/models/quiz.dart';
import 'package:flutterquiz/src/domain/use_cases/quiz.use_case.dart';
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
    Question question = await ref.read(quizUseCaseProvider.notifier).getQuestionById(questionId: questionId);

    final List<Answer> answers =
        await ref.read(quizUseCaseProvider.notifier).getAnswersByQuestionId(questionId: question.id);

    question = question.copyWith(answers: answers);

    return question;
  }
}
