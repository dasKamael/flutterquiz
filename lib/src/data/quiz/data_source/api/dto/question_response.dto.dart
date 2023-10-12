import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_response.dto.freezed.dart';
part 'question_response.dto.g.dart';

@freezed
class QuestionResponseDto with _$QuestionResponseDto {
  const factory QuestionResponseDto({
    required String id,
    required String question,
    required String explanation,
    required String type,
    @JsonKey(name: 'explanation_link') required String explanationLink,
    @JsonKey(name: 'quiz_id') required String quizId,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _QuestionResponseDto;
  factory QuestionResponseDto.fromJson(Map<String, dynamic> json) => _$QuestionResponseDtoFromJson(json);
}
