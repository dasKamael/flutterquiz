import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/common/supabase/supabase.provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Provider for Supabase AuthState changes
final supabaseAuthChangesProvider = StreamProvider<AuthState>((ref) {
  return ref.watch(supabaseClientProvider).auth.onAuthStateChange;
});
