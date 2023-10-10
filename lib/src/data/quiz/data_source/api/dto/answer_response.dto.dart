import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_response.dto.freezed.dart';
part 'answer_response.dto.g.dart';

@freezed
class AnswerResponseDto with _$AnswerResponseDto {
  const factory AnswerResponseDto({
    required String id,
    required String answer,
    @JsonKey(name: 'widget_type') required String widgetType,
    @JsonKey(name: 'is_correct') required bool isCorrect,
    @JsonKey(name: 'question_id') required String questionId,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _AnswerResponseDto;
  factory AnswerResponseDto.fromJson(Map<String, dynamic> json) => _$AnswerResponseDtoFromJson(json);
}
