// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LeaderboardEntry {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get quizId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LeaderboardEntryCopyWith<LeaderboardEntry> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardEntryCopyWith<$Res> {
  factory $LeaderboardEntryCopyWith(LeaderboardEntry value, $Res Function(LeaderboardEntry) then) =
      _$LeaderboardEntryCopyWithImpl<$Res, LeaderboardEntry>;
  @useResult
  $Res call(
      {String id, String userId, String quizId, String username, int score, DateTime createdAt, DateTime? updatedAt});
}

/// @nodoc
class _$LeaderboardEntryCopyWithImpl<$Res, $Val extends LeaderboardEntry> implements $LeaderboardEntryCopyWith<$Res> {
  _$LeaderboardEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? quizId = null,
    Object? username = null,
    Object? score = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LeaderboardEntryCopyWith<$Res> implements $LeaderboardEntryCopyWith<$Res> {
  factory _$$_LeaderboardEntryCopyWith(_$_LeaderboardEntry value, $Res Function(_$_LeaderboardEntry) then) =
      __$$_LeaderboardEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String userId, String quizId, String username, int score, DateTime createdAt, DateTime? updatedAt});
}

/// @nodoc
class __$$_LeaderboardEntryCopyWithImpl<$Res> extends _$LeaderboardEntryCopyWithImpl<$Res, _$_LeaderboardEntry>
    implements _$$_LeaderboardEntryCopyWith<$Res> {
  __$$_LeaderboardEntryCopyWithImpl(_$_LeaderboardEntry _value, $Res Function(_$_LeaderboardEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? quizId = null,
    Object? username = null,
    Object? score = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_LeaderboardEntry(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_LeaderboardEntry implements _LeaderboardEntry {
  const _$_LeaderboardEntry(
      {required this.id,
      required this.userId,
      required this.quizId,
      required this.username,
      required this.score,
      required this.createdAt,
      this.updatedAt});

  @override
  final String id;
  @override
  final String userId;
  @override
  final String quizId;
  @override
  final String username;
  @override
  final int score;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'LeaderboardEntry(id: $id, userId: $userId, quizId: $quizId, username: $username, score: $score, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LeaderboardEntry &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.username, username) || other.username == username) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userId, quizId, username, score, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LeaderboardEntryCopyWith<_$_LeaderboardEntry> get copyWith =>
      __$$_LeaderboardEntryCopyWithImpl<_$_LeaderboardEntry>(this, _$identity);
}

abstract class _LeaderboardEntry implements LeaderboardEntry {
  const factory _LeaderboardEntry(
      {required final String id,
      required final String userId,
      required final String quizId,
      required final String username,
      required final int score,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$_LeaderboardEntry;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get quizId;
  @override
  String get username;
  @override
  int get score;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_LeaderboardEntryCopyWith<_$_LeaderboardEntry> get copyWith => throw _privateConstructorUsedError;
}
