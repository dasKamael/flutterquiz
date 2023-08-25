import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

part 'supabase.provider.g.dart';

@Riverpod(keepAlive: true)
SupabaseClient supabaseClient(SupabaseClientRef ref) {
  final supabaseClient = Supabase.instance.client;
  ref.onDispose(() => supabaseClient.dispose());
  return supabaseClient;
}
