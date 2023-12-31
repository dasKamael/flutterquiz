import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutterquiz/src/common/logging/logger.dart';
import 'package:flutterquiz/src/common/utils/ui_plattform.dart';
import 'package:logging/logging.dart';
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
      // Setup Logger
      setupLogger(level: UiPlatform.isDebugMode ? Level.INFO : Level.WARNING);
      Logger.root.info('main: Quiz app started');

      // Path strategy for Flutter Web e.g. no # in url
      usePathUrlStrategy();

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
      Logger.root.severe('bootstrap: zone-error', error, stackTrace);
    },
  );
}
