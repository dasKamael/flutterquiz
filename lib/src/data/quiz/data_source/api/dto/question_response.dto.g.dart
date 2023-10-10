// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_response.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionResponseDto _$$_QuestionResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_QuestionResponseDto(
      id: json['id'] as String,
      question: json['question'] as String,
      explanation: json['explanation'] as String,
      type: json['type'] as String,
      widgetType: json['widget_type'] as String,
      explanationLink: json['explanation_link'] as String,
      quizId: json['quiz_id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_QuestionResponseDtoToJson(
        _$_QuestionResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'explanation': instance.explanation,
      'type': instance.type,
      'widget_type': instance.widgetType,
      'explanation_link': instance.explanationLink,
      'quiz_id': instance.quizId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
