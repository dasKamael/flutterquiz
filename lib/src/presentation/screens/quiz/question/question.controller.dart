import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_answers.service.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_question.service.dart';
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
    Question question = await ref.read(getQuestionServiceProvider(questionId: questionId).future);

    final List<Answer> answers = ref.read(getAnswersServiceProvider(questionId: question.id)).value ?? [];

    question = question.copyWith(answers: answers);

    return question;
  }
}
