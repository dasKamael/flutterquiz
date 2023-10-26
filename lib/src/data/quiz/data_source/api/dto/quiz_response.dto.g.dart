// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_response.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizResponseDto _$$_QuizResponseDtoFromJson(Map<String, dynamic> json) =>
    _$_QuizResponseDto(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      createdBy: json['created_by'] as String,
      isPrivate: json['is_private'] as bool,
      rating: (json['rating'] as num).toDouble(),
      userRatedCount: json['user_rated_count'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_QuizResponseDtoToJson(_$_QuizResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'created_by': instance.createdBy,
      'is_private': instance.isPrivate,
      'rating': instance.rating,
      'user_rated_count': instance.userRatedCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
