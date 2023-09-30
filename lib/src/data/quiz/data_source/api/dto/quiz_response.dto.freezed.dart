// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_response.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizResponseDto _$QuizResponseDtoFromJson(Map<String, dynamic> json) {
  return _QuizResponseDto.fromJson(json);
}

/// @nodoc
mixin _$QuizResponseDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_private')
  bool get isPrivate => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_rated_count')
  int get userRatedCount => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizResponseDtoCopyWith<QuizResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResponseDtoCopyWith<$Res> {
  factory $QuizResponseDtoCopyWith(
          QuizResponseDto value, $Res Function(QuizResponseDto) then) =
      _$QuizResponseDtoCopyWithImpl<$Res, QuizResponseDto>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      @JsonKey(name: 'created_by') String createdBy,
      @JsonKey(name: 'is_private') bool isPrivate,
      @JsonKey(name: 'user_rated_count') int userRatedCount,
      double rating,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$QuizResponseDtoCopyWithImpl<$Res, $Val extends QuizResponseDto>
    implements $QuizResponseDtoCopyWith<$Res> {
  _$QuizResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? createdBy = null,
    Object? isPrivate = null,
    Object? userRatedCount = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      userRatedCount: null == userRatedCount
          ? _value.userRatedCount
          : userRatedCount // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$_QuizResponseDtoCopyWith<$Res>
    implements $QuizResponseDtoCopyWith<$Res> {
  factory _$$_QuizResponseDtoCopyWith(
          _$_QuizResponseDto value, $Res Function(_$_QuizResponseDto) then) =
      __$$_QuizResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      @JsonKey(name: 'created_by') String createdBy,
      @JsonKey(name: 'is_private') bool isPrivate,
      @JsonKey(name: 'user_rated_count') int userRatedCount,
      double rating,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$_QuizResponseDtoCopyWithImpl<$Res>
    extends _$QuizResponseDtoCopyWithImpl<$Res, _$_QuizResponseDto>
    implements _$$_QuizResponseDtoCopyWith<$Res> {
  __$$_QuizResponseDtoCopyWithImpl(
      _$_QuizResponseDto _value, $Res Function(_$_QuizResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? createdBy = null,
    Object? isPrivate = null,
    Object? userRatedCount = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_QuizResponseDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      userRatedCount: null == userRatedCount
          ? _value.userRatedCount
          : userRatedCount // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$_QuizResponseDto implements _QuizResponseDto {
  const _$_QuizResponseDto(
      {required this.id,
      required this.title,
      required this.description,
      @JsonKey(name: 'created_by') required this.createdBy,
      @JsonKey(name: 'is_private') required this.isPrivate,
      @JsonKey(name: 'user_rated_count') required this.userRatedCount,
      required this.rating,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$_QuizResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_QuizResponseDtoFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey(name: 'created_by')
  final String createdBy;
  @override
  @JsonKey(name: 'is_private')
  final bool isPrivate;
  @override
  @JsonKey(name: 'user_rated_count')
  final int userRatedCount;
  @override
  final double rating;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'QuizResponseDto(id: $id, title: $title, description: $description, createdBy: $createdBy, isPrivate: $isPrivate, userRatedCount: $userRatedCount, rating: $rating, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizResponseDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.userRatedCount, userRatedCount) ||
                other.userRatedCount == userRatedCount) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      createdBy, isPrivate, userRatedCount, rating, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizResponseDtoCopyWith<_$_QuizResponseDto> get copyWith =>
      __$$_QuizResponseDtoCopyWithImpl<_$_QuizResponseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizResponseDtoToJson(
      this,
    );
  }
}

abstract class _QuizResponseDto implements QuizResponseDto {
  const factory _QuizResponseDto(
          {required final String id,
          required final String title,
          required final String description,
          @JsonKey(name: 'created_by') required final String createdBy,
          @JsonKey(name: 'is_private') required final bool isPrivate,
          @JsonKey(name: 'user_rated_count') required final int userRatedCount,
          required final double rating,
          @JsonKey(name: 'created_at') required final String createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt}) =
      _$_QuizResponseDto;

  factory _QuizResponseDto.fromJson(Map<String, dynamic> json) =
      _$_QuizResponseDto.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'created_by')
  String get createdBy;
  @override
  @JsonKey(name: 'is_private')
  bool get isPrivate;
  @override
  @JsonKey(name: 'user_rated_count')
  int get userRatedCount;
  @override
  double get rating;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_QuizResponseDtoCopyWith<_$_QuizResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
