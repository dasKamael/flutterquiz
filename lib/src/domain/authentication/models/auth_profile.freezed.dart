// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthProfile {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthProfileCopyWith<AuthProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthProfileCopyWith<$Res> {
  factory $AuthProfileCopyWith(
          AuthProfile value, $Res Function(AuthProfile) then) =
      _$AuthProfileCopyWithImpl<$Res, AuthProfile>;
  @useResult
  $Res call({String id, String username, String email});
}

/// @nodoc
class _$AuthProfileCopyWithImpl<$Res, $Val extends AuthProfile>
    implements $AuthProfileCopyWith<$Res> {
  _$AuthProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthProfileCopyWith<$Res>
    implements $AuthProfileCopyWith<$Res> {
  factory _$$_AuthProfileCopyWith(
          _$_AuthProfile value, $Res Function(_$_AuthProfile) then) =
      __$$_AuthProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String username, String email});
}

/// @nodoc
class __$$_AuthProfileCopyWithImpl<$Res>
    extends _$AuthProfileCopyWithImpl<$Res, _$_AuthProfile>
    implements _$$_AuthProfileCopyWith<$Res> {
  __$$_AuthProfileCopyWithImpl(
      _$_AuthProfile _value, $Res Function(_$_AuthProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
  }) {
    return _then(_$_AuthProfile(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthProfile implements _AuthProfile {
  const _$_AuthProfile(
      {required this.id, required this.username, required this.email});

  @override
  final String id;
  @override
  final String username;
  @override
  final String email;

  @override
  String toString() {
    return 'AuthProfile(id: $id, username: $username, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, username, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthProfileCopyWith<_$_AuthProfile> get copyWith =>
      __$$_AuthProfileCopyWithImpl<_$_AuthProfile>(this, _$identity);
}

abstract class _AuthProfile implements AuthProfile {
  const factory _AuthProfile(
      {required final String id,
      required final String username,
      required final String email}) = _$_AuthProfile;

  @override
  String get id;
  @override
  String get username;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_AuthProfileCopyWith<_$_AuthProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
