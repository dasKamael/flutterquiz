import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'CreateUpdateQuestionWithAnswers.dto.freezed.dart';

@freezed
class CreateUpdateQuestionWithAnswersDto with _$CreateUpdateQuestionWithAnswersDto {
  const factory CreateUpdateQuestionWithAnswersDto({
    required String quizId,
    required String questionId,
    required String questionTitle,
    required List<Answer> answers,
  }) = _CreateUpdateQuestionWithAnswersDto;
}
