// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_response.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionResponseDto _$QuestionResponseDtoFromJson(Map<String, dynamic> json) {
  return _QuestionResponseDto.fromJson(json);
}

/// @nodoc
mixin _$QuestionResponseDto {
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'explanation_link')
  String get explanationLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_id')
  String get quizId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionResponseDtoCopyWith<QuestionResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionResponseDtoCopyWith<$Res> {
  factory $QuestionResponseDtoCopyWith(
          QuestionResponseDto value, $Res Function(QuestionResponseDto) then) =
      _$QuestionResponseDtoCopyWithImpl<$Res, QuestionResponseDto>;
  @useResult
  $Res call(
      {String id,
      String question,
      String explanation,
      String type,
      @JsonKey(name: 'explanation_link') String explanationLink,
      @JsonKey(name: 'quiz_id') String quizId,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$QuestionResponseDtoCopyWithImpl<$Res, $Val extends QuestionResponseDto>
    implements $QuestionResponseDtoCopyWith<$Res> {
  _$QuestionResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? explanation = null,
    Object? type = null,
    Object? explanationLink = null,
    Object? quizId = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      explanationLink: null == explanationLink
          ? _value.explanationLink
          : explanationLink // ignore: cast_nullable_to_non_nullable
              as String,
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionResponseDtoCopyWith<$Res>
    implements $QuestionResponseDtoCopyWith<$Res> {
  factory _$$_QuestionResponseDtoCopyWith(_$_QuestionResponseDto value,
          $Res Function(_$_QuestionResponseDto) then) =
      __$$_QuestionResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String question,
      String explanation,
      String type,
      @JsonKey(name: 'explanation_link') String explanationLink,
      @JsonKey(name: 'quiz_id') String quizId,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$_QuestionResponseDtoCopyWithImpl<$Res>
    extends _$QuestionResponseDtoCopyWithImpl<$Res, _$_QuestionResponseDto>
    implements _$$_QuestionResponseDtoCopyWith<$Res> {
  __$$_QuestionResponseDtoCopyWithImpl(_$_QuestionResponseDto _value,
      $Res Function(_$_QuestionResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? explanation = null,
    Object? type = null,
    Object? explanationLink = null,
    Object? quizId = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_QuestionResponseDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      explanationLink: null == explanationLink
          ? _value.explanationLink
          : explanationLink // ignore: cast_nullable_to_non_nullable
              as String,
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionResponseDto implements _QuestionResponseDto {
  const _$_QuestionResponseDto(
      {required this.id,
      required this.question,
      required this.explanation,
      required this.type,
      @JsonKey(name: 'explanation_link') required this.explanationLink,
      @JsonKey(name: 'quiz_id') required this.quizId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$_QuestionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionResponseDtoFromJson(json);

  @override
  final String id;
  @override
  final String question;
  @override
  final String explanation;
  @override
  final String type;
  @override
  @JsonKey(name: 'explanation_link')
  final String explanationLink;
  @override
  @JsonKey(name: 'quiz_id')
  final String quizId;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'QuestionResponseDto(id: $id, question: $question, explanation: $explanation, type: $type, explanationLink: $explanationLink, quizId: $quizId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionResponseDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.explanationLink, explanationLink) ||
                other.explanationLink == explanationLink) &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, explanation, type,
      explanationLink, quizId, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionResponseDtoCopyWith<_$_QuestionResponseDto> get copyWith =>
      __$$_QuestionResponseDtoCopyWithImpl<_$_QuestionResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionResponseDtoToJson(
      this,
    );
  }
}

abstract class _QuestionResponseDto implements QuestionResponseDto {
  const factory _QuestionResponseDto(
      {required final String id,
      required final String question,
      required final String explanation,
      required final String type,
      @JsonKey(name: 'explanation_link') required final String explanationLink,
      @JsonKey(name: 'quiz_id') required final String quizId,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'updated_at')
      final String? updatedAt}) = _$_QuestionResponseDto;

  factory _QuestionResponseDto.fromJson(Map<String, dynamic> json) =
      _$_QuestionResponseDto.fromJson;

  @override
  String get id;
  @override
  String get question;
  @override
  String get explanation;
  @override
  String get type;
  @override
  @JsonKey(name: 'explanation_link')
  String get explanationLink;
  @override
  @JsonKey(name: 'quiz_id')
  String get quizId;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionResponseDtoCopyWith<_$_QuestionResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
