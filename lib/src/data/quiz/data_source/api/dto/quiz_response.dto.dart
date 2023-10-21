import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_response.dto.freezed.dart';
part 'quiz_response.dto.g.dart';

@freezed
class QuizResponseDto with _$QuizResponseDto {
  const factory QuizResponseDto({
    required String id,
    required String title,
    required String description,
    @JsonKey(name: 'created_by') required String createdBy,
    @JsonKey(name: 'is_private') required bool isPrivate,
    required double rating,
    @JsonKey(name: 'user_rated_count') required int userRatedCount,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _QuizResponseDto;
  factory QuizResponseDto.fromJson(Map<String, dynamic> json) => _$QuizResponseDtoFromJson(json);
}
