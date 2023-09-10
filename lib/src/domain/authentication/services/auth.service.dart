import 'package:flutter/material.dart';
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
    listenToAuthChanges();

    return null;
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

  /// Login with user and pw
  Future<(bool, String?)> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final supabaseClient = ref.watch(supabaseClientProvider);
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        state = _authProfileFromJwt(response.user!);
      }
      return (true, null);
    } catch (e, stackStrace) {
      log.severe('Login Error: ', e, stackStrace);
      String msg = e.toString();
      String submsg1 = 'Invalid login credentials';
      String submsg2 = 'Email not confirmed';

      String? sendMsg;

      if (msg.contains(submsg1) && context.mounted) {
        //sendMsg = context.translations.auth_login_invalid_credentials;
      } else if (msg.contains(submsg2) && context.mounted) {
        //sendMsg = context.translations.auth_login_mail_not_confirmed;
      } else {
        sendMsg = null;
      }

      return (false, sendMsg);
    }
  }
}
