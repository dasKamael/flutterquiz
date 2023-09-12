// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_quiz.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditQuizState {
  String get title => throw _privateConstructorUsedError;
  List<Question> get questions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditQuizStateCopyWith<EditQuizState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditQuizStateCopyWith<$Res> {
  factory $EditQuizStateCopyWith(EditQuizState value, $Res Function(EditQuizState) then) =
      _$EditQuizStateCopyWithImpl<$Res, EditQuizState>;
  @useResult
  $Res call({String title, List<Question> questions});
}

/// @nodoc
class _$EditQuizStateCopyWithImpl<$Res, $Val extends EditQuizState> implements $EditQuizStateCopyWith<$Res> {
  _$EditQuizStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditQuizStateCopyWith<$Res> implements $EditQuizStateCopyWith<$Res> {
  factory _$$_EditQuizStateCopyWith(_$_EditQuizState value, $Res Function(_$_EditQuizState) then) =
      __$$_EditQuizStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<Question> questions});
}

/// @nodoc
class __$$_EditQuizStateCopyWithImpl<$Res> extends _$EditQuizStateCopyWithImpl<$Res, _$_EditQuizState>
    implements _$$_EditQuizStateCopyWith<$Res> {
  __$$_EditQuizStateCopyWithImpl(_$_EditQuizState _value, $Res Function(_$_EditQuizState) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? questions = null,
  }) {
    return _then(_$_EditQuizState(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ));
  }
}

/// @nodoc

class _$_EditQuizState implements _EditQuizState {
  const _$_EditQuizState({this.title = '', final List<Question> questions = const []}) : _questions = questions;

  @override
  @JsonKey()
  final String title;
  final List<Question> _questions;
  @override
  @JsonKey()
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'EditQuizState(title: $title, questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditQuizState &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._questions, _questions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditQuizStateCopyWith<_$_EditQuizState> get copyWith =>
      __$$_EditQuizStateCopyWithImpl<_$_EditQuizState>(this, _$identity);
}

abstract class _EditQuizState implements EditQuizState {
  const factory _EditQuizState({final String title, final List<Question> questions}) = _$_EditQuizState;

  @override
  String get title;
  @override
  List<Question> get questions;
  @override
  @JsonKey(ignore: true)
  _$$_EditQuizStateCopyWith<_$_EditQuizState> get copyWith => throw _privateConstructorUsedError;
}
