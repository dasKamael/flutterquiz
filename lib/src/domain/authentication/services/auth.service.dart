import 'package:flutterquiz/src/common/supabase/supabase.provider.dart';
import 'package:flutterquiz/src/domain/authentication/models/auth_profile.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth.service.g.dart';

@Riverpod(keepAlive: true)
class AuthService extends _$AuthService {
  static final log = Logger('AuthUseCase');
  @override
  AuthProfile? build() {
    final supabaseClient = ref.watch(supabaseClientProvider);

    return const AuthProfile(id: '', username: 'Kevin', email: 'kev@kev.de');
  }

  void listenToAuthChanges() {
    Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
      log.info('AuthState changed: ${data.event}');

      switch (data.event) {
        case AuthChangeEvent.signedOut:
          state = null;
          break;
        default:
          final Session? session = data.session;
          if (session != null) {
            final User supabaseUser = session.user;
            state = _authProfileFromJwt(supabaseUser);
          }
      }
    });
  }

  AuthProfile? _authProfileFromJwt(User supabaseUser) {
    try {
      final authProfile = AuthProfile(
        id: supabaseUser.id,
        username: supabaseUser.userMetadata?['username'],
        email: supabaseUser.email!,
      );
      return authProfile;
    } catch (e) {
      log.severe('_authProfileFromJwt: Error parsing auth profile: $e');
      return null;
    }
  }

  /// Logout
  Future<bool> signOut() async {
    final supabaseClient = ref.watch(supabaseClientProvider);
    try {
      await supabaseClient.auth.signOut();
      state = null;
      return true;
    } catch (e, stackStrace) {
      log.severe('Sign Out Error: ', e, stackStrace);
      return false;
    }
  }

  Future<bool> userAlreadyExists({required String email}) async {
    final supabaseClient = ref.watch(supabaseClientProvider);
    return await supabaseClient.rpc('user_exists', params: {'email': email});
  }
}
