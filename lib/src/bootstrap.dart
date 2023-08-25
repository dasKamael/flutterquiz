import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:supabase_flutter/supabase_flutter.dart';

// Helper Function to handle errors easily
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  // Run app in zone to catch application errors
  await runZonedGuarded(
    () async {
      // Supabase client
      await Supabase.initialize(
        url: 'https://ihnibvlskzwiubulxmlt.supabase.co',
        anonKey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlobmlidmxza3p3aXVidWx4bWx0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI2MjEzNTEsImV4cCI6MjAwODE5NzM1MX0.bBBO_6cHsby11hdy5ijQJunkRHvZs975sMAsXZUVBRg',
      );

      return runApp(
        ProviderScope(
          child: await builder(),
        ),
      );
    },
    (error, stackTrace) {
      // if (UiPlatform.isWeb || UiPlatform.isDebugMode) {
      //   Logger.root.severe('bootstrap: zone-error', error, stackTrace);
      // } else {
      //   FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
      // }
    },
  );
}
