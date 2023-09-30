// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_response.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnswerResponseDto _$AnswerResponseDtoFromJson(Map<String, dynamic> json) {
  return _AnswerResponseDto.fromJson(json);
}

/// @nodoc
mixin _$AnswerResponseDto {
  String get id => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_correct')
  bool get isCorrect => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_id')
  String get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerResponseDtoCopyWith<AnswerResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerResponseDtoCopyWith<$Res> {
  factory $AnswerResponseDtoCopyWith(
          AnswerResponseDto value, $Res Function(AnswerResponseDto) then) =
      _$AnswerResponseDtoCopyWithImpl<$Res, AnswerResponseDto>;
  @useResult
  $Res call(
      {String id,
      String answer,
      @JsonKey(name: 'is_correct') bool isCorrect,
      @JsonKey(name: 'question_id') String questionId,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$AnswerResponseDtoCopyWithImpl<$Res, $Val extends AnswerResponseDto>
    implements $AnswerResponseDtoCopyWith<$Res> {
  _$AnswerResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? isCorrect = null,
    Object? questionId = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_AnswerResponseDtoCopyWith<$Res>
    implements $AnswerResponseDtoCopyWith<$Res> {
  factory _$$_AnswerResponseDtoCopyWith(_$_AnswerResponseDto value,
          $Res Function(_$_AnswerResponseDto) then) =
      __$$_AnswerResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String answer,
      @JsonKey(name: 'is_correct') bool isCorrect,
      @JsonKey(name: 'question_id') String questionId,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$_AnswerResponseDtoCopyWithImpl<$Res>
    extends _$AnswerResponseDtoCopyWithImpl<$Res, _$_AnswerResponseDto>
    implements _$$_AnswerResponseDtoCopyWith<$Res> {
  __$$_AnswerResponseDtoCopyWithImpl(
      _$_AnswerResponseDto _value, $Res Function(_$_AnswerResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? isCorrect = null,
    Object? questionId = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_AnswerResponseDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
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
class _$_AnswerResponseDto implements _AnswerResponseDto {
  const _$_AnswerResponseDto(
      {required this.id,
      required this.answer,
      @JsonKey(name: 'is_correct') required this.isCorrect,
      @JsonKey(name: 'question_id') required this.questionId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$_AnswerResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerResponseDtoFromJson(json);

  @override
  final String id;
  @override
  final String answer;
  @override
  @JsonKey(name: 'is_correct')
  final bool isCorrect;
  @override
  @JsonKey(name: 'question_id')
  final String questionId;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'AnswerResponseDto(id: $id, answer: $answer, isCorrect: $isCorrect, questionId: $questionId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerResponseDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, answer, isCorrect, questionId, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerResponseDtoCopyWith<_$_AnswerResponseDto> get copyWith =>
      __$$_AnswerResponseDtoCopyWithImpl<_$_AnswerResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerResponseDtoToJson(
      this,
    );
  }
}

abstract class _AnswerResponseDto implements AnswerResponseDto {
  const factory _AnswerResponseDto(
          {required final String id,
          required final String answer,
          @JsonKey(name: 'is_correct') required final bool isCorrect,
          @JsonKey(name: 'question_id') required final String questionId,
          @JsonKey(name: 'created_at') required final String createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt}) =
      _$_AnswerResponseDto;

  factory _AnswerResponseDto.fromJson(Map<String, dynamic> json) =
      _$_AnswerResponseDto.fromJson;

  @override
  String get id;
  @override
  String get answer;
  @override
  @JsonKey(name: 'is_correct')
  bool get isCorrect;
  @override
  @JsonKey(name: 'question_id')
  String get questionId;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerResponseDtoCopyWith<_$_AnswerResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
