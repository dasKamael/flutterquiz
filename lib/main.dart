import 'package:flutterquiz/src/app.dart';
import 'package:flutterquiz/src/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
