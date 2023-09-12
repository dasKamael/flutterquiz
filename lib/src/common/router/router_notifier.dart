import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/authentication/services/auth.service.dart';

/// Creates a Notifier to be used in GoRouter
///
/// While it is not recommended to use `ChangeNotifier` anywhere else
/// (reference: https://riverpod.dev/docs/concepts/providers/#different-types-of-providers),
/// `ChangeNotifier` is a forced choice with go_router.
///
/// GoRouter's refreshListenable only accepts a `Listenable` object as a parameter
/// and therefore `ChangeNotifier` is used here,
/// whereas `StateNotifier` is not a `Listenable`, so we can't use it.
///
/// Here we inject a `Ref` so that it's possible to exploit `ref.listen()` to
/// notify GoRouter that something's changed in our providers.
///
/// Note how we're forced to explicitly call `notifyListeners()`
/// to make this work.
class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen(authServiceProvider, (previous, next) {
      notifyListeners();
    });
  }
}
