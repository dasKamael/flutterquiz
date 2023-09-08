import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_profile.freezed.dart';

@freezed
class AuthProfile with _$AuthProfile {
  const factory AuthProfile({
    required String id,
    required String username,
    required String email,
  }) = _AuthProfile;
}
