import 'package:flutter/material.dart';
import 'package:flutterquiz/src/common/utils/ui_plattform.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtil {
  static void openUrl(String url, BuildContext context) async {
    final log = Logger('WeblinkUtil');
    final launchMode = UiPlatform.isAndroid ? LaunchMode.externalApplication : LaunchMode.platformDefault;
    final uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: launchMode)) {
      log.warning('openUrl: Could not launch $url');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not open $url'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
