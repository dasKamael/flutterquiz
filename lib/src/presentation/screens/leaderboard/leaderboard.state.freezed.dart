// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LeaderboardState {
  String get quizId => throw _privateConstructorUsedError;
  String get quizTitle => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  List<LeaderboardEntry> get entries => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LeaderboardStateCopyWith<LeaderboardState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardStateCopyWith<$Res> {
  factory $LeaderboardStateCopyWith(LeaderboardState value, $Res Function(LeaderboardState) then) =
      _$LeaderboardStateCopyWithImpl<$Res, LeaderboardState>;
  @useResult
  $Res call({String quizId, String quizTitle, int score, List<LeaderboardEntry> entries});
}

/// @nodoc
class _$LeaderboardStateCopyWithImpl<$Res, $Val extends LeaderboardState> implements $LeaderboardStateCopyWith<$Res> {
  _$LeaderboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? quizTitle = null,
    Object? score = null,
    Object? entries = null,
  }) {
    return _then(_value.copyWith(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      quizTitle: null == quizTitle
          ? _value.quizTitle
          : quizTitle // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardEntry>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LeaderboardStateCopyWith<$Res> implements $LeaderboardStateCopyWith<$Res> {
  factory _$$_LeaderboardStateCopyWith(_$_LeaderboardState value, $Res Function(_$_LeaderboardState) then) =
      __$$_LeaderboardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String quizId, String quizTitle, int score, List<LeaderboardEntry> entries});
}

/// @nodoc
class __$$_LeaderboardStateCopyWithImpl<$Res> extends _$LeaderboardStateCopyWithImpl<$Res, _$_LeaderboardState>
    implements _$$_LeaderboardStateCopyWith<$Res> {
  __$$_LeaderboardStateCopyWithImpl(_$_LeaderboardState _value, $Res Function(_$_LeaderboardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? quizTitle = null,
    Object? score = null,
    Object? entries = null,
  }) {
    return _then(_$_LeaderboardState(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      quizTitle: null == quizTitle
          ? _value.quizTitle
          : quizTitle // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardEntry>,
    ));
  }
}

/// @nodoc

class _$_LeaderboardState implements _LeaderboardState {
  const _$_LeaderboardState(
      {required this.quizId,
      required this.quizTitle,
      required this.score,
      required final List<LeaderboardEntry> entries})
      : _entries = entries;

  @override
  final String quizId;
  @override
  final String quizTitle;
  @override
  final int score;
  final List<LeaderboardEntry> _entries;
  @override
  List<LeaderboardEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  String toString() {
    return 'LeaderboardState(quizId: $quizId, quizTitle: $quizTitle, score: $score, entries: $entries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LeaderboardState &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.quizTitle, quizTitle) || other.quizTitle == quizTitle) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quizId, quizTitle, score, const DeepCollectionEquality().hash(_entries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LeaderboardStateCopyWith<_$_LeaderboardState> get copyWith =>
      __$$_LeaderboardStateCopyWithImpl<_$_LeaderboardState>(this, _$identity);
}

abstract class _LeaderboardState implements LeaderboardState {
  const factory _LeaderboardState(
      {required final String quizId,
      required final String quizTitle,
      required final int score,
      required final List<LeaderboardEntry> entries}) = _$_LeaderboardState;

  @override
  String get quizId;
  @override
  String get quizTitle;
  @override
  int get score;
  @override
  List<LeaderboardEntry> get entries;
  @override
  @JsonKey(ignore: true)
  _$$_LeaderboardStateCopyWith<_$_LeaderboardState> get copyWith => throw _privateConstructorUsedError;
}
