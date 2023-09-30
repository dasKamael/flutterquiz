// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_response.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnswerResponseDto _$$_AnswerResponseDtoFromJson(Map<String, dynamic> json) =>
    _$_AnswerResponseDto(
      id: json['id'] as String,
      answer: json['answer'] as String,
      isCorrect: json['is_correct'] as bool,
      questionId: json['question_id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_AnswerResponseDtoToJson(
        _$_AnswerResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'is_correct': instance.isCorrect,
      'question_id': instance.questionId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
