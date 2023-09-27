// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CreateUpdateQuestionWithAnswers.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateUpdateQuestionWithAnswersDto {
  String get quizId => throw _privateConstructorUsedError;
  String get questionId => throw _privateConstructorUsedError;
  String get questionTitle => throw _privateConstructorUsedError;
  List<Answer> get answers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateUpdateQuestionWithAnswersDtoCopyWith<CreateUpdateQuestionWithAnswersDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUpdateQuestionWithAnswersDtoCopyWith<$Res> {
  factory $CreateUpdateQuestionWithAnswersDtoCopyWith(
          CreateUpdateQuestionWithAnswersDto value, $Res Function(CreateUpdateQuestionWithAnswersDto) then) =
      _$CreateUpdateQuestionWithAnswersDtoCopyWithImpl<$Res, CreateUpdateQuestionWithAnswersDto>;
  @useResult
  $Res call({String quizId, String questionId, String questionTitle, List<Answer> answers});
}

/// @nodoc
class _$CreateUpdateQuestionWithAnswersDtoCopyWithImpl<$Res, $Val extends CreateUpdateQuestionWithAnswersDto>
    implements $CreateUpdateQuestionWithAnswersDtoCopyWith<$Res> {
  _$CreateUpdateQuestionWithAnswersDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? questionId = null,
    Object? questionTitle = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      questionTitle: null == questionTitle
          ? _value.questionTitle
          : questionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateUpdateQuestionWithAnswersDtoCopyWith<$Res>
    implements $CreateUpdateQuestionWithAnswersDtoCopyWith<$Res> {
  factory _$$_CreateUpdateQuestionWithAnswersDtoCopyWith(
          _$_CreateUpdateQuestionWithAnswersDto value, $Res Function(_$_CreateUpdateQuestionWithAnswersDto) then) =
      __$$_CreateUpdateQuestionWithAnswersDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String quizId, String questionId, String questionTitle, List<Answer> answers});
}

/// @nodoc
class __$$_CreateUpdateQuestionWithAnswersDtoCopyWithImpl<$Res>
    extends _$CreateUpdateQuestionWithAnswersDtoCopyWithImpl<$Res, _$_CreateUpdateQuestionWithAnswersDto>
    implements _$$_CreateUpdateQuestionWithAnswersDtoCopyWith<$Res> {
  __$$_CreateUpdateQuestionWithAnswersDtoCopyWithImpl(
      _$_CreateUpdateQuestionWithAnswersDto _value, $Res Function(_$_CreateUpdateQuestionWithAnswersDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? questionId = null,
    Object? questionTitle = null,
    Object? answers = null,
  }) {
    return _then(_$_CreateUpdateQuestionWithAnswersDto(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      questionTitle: null == questionTitle
          ? _value.questionTitle
          : questionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
    ));
  }
}

/// @nodoc

class _$_CreateUpdateQuestionWithAnswersDto implements _CreateUpdateQuestionWithAnswersDto {
  const _$_CreateUpdateQuestionWithAnswersDto(
      {required this.quizId,
      required this.questionId,
      required this.questionTitle,
      required final List<Answer> answers})
      : _answers = answers;

  @override
  final String quizId;
  @override
  final String questionId;
  @override
  final String questionTitle;
  final List<Answer> _answers;
  @override
  List<Answer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'CreateUpdateQuestionWithAnswersDto(quizId: $quizId, questionId: $questionId, questionTitle: $questionTitle, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateUpdateQuestionWithAnswersDto &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.questionId, questionId) || other.questionId == questionId) &&
            (identical(other.questionTitle, questionTitle) || other.questionTitle == questionTitle) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, quizId, questionId, questionTitle, const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateUpdateQuestionWithAnswersDtoCopyWith<_$_CreateUpdateQuestionWithAnswersDto> get copyWith =>
      __$$_CreateUpdateQuestionWithAnswersDtoCopyWithImpl<_$_CreateUpdateQuestionWithAnswersDto>(this, _$identity);
}

abstract class _CreateUpdateQuestionWithAnswersDto implements CreateUpdateQuestionWithAnswersDto {
  const factory _CreateUpdateQuestionWithAnswersDto(
      {required final String quizId,
      required final String questionId,
      required final String questionTitle,
      required final List<Answer> answers}) = _$_CreateUpdateQuestionWithAnswersDto;

  @override
  String get quizId;
  @override
  String get questionId;
  @override
  String get questionTitle;
  @override
  List<Answer> get answers;
  @override
  @JsonKey(ignore: true)
  _$$_CreateUpdateQuestionWithAnswersDtoCopyWith<_$_CreateUpdateQuestionWithAnswersDto> get copyWith =>
      throw _privateConstructorUsedError;
}
