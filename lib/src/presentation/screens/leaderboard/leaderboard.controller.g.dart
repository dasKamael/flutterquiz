// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leaderboardControllerHash() => r'0612e57765c05ec1dcd9131bf90ce41018b211d3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$LeaderboardController extends BuildlessAutoDisposeAsyncNotifier<LeaderboardState> {
  late final String quizId;

  FutureOr<LeaderboardState> build({
    required String quizId,
  });
}

/// See also [LeaderboardController].
@ProviderFor(LeaderboardController)
const leaderboardControllerProvider = LeaderboardControllerFamily();

/// See also [LeaderboardController].
class LeaderboardControllerFamily extends Family<AsyncValue<LeaderboardState>> {
  /// See also [LeaderboardController].
  const LeaderboardControllerFamily();

  /// See also [LeaderboardController].
  LeaderboardControllerProvider call({
    required String quizId,
  }) {
    return LeaderboardControllerProvider(
      quizId: quizId,
    );
  }

  @override
  LeaderboardControllerProvider getProviderOverride(
    covariant LeaderboardControllerProvider provider,
  ) {
    return call(
      quizId: provider.quizId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'leaderboardControllerProvider';
}

/// See also [LeaderboardController].
class LeaderboardControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LeaderboardController, LeaderboardState> {
  /// See also [LeaderboardController].
  LeaderboardControllerProvider({
    required this.quizId,
  }) : super.internal(
          () => LeaderboardController()..quizId = quizId,
          from: leaderboardControllerProvider,
          name: r'leaderboardControllerProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$leaderboardControllerHash,
          dependencies: LeaderboardControllerFamily._dependencies,
          allTransitiveDependencies: LeaderboardControllerFamily._allTransitiveDependencies,
        );

  final String quizId;

  @override
  bool operator ==(Object other) {
    return other is LeaderboardControllerProvider && other.quizId == quizId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<LeaderboardState> runNotifierBuild(
    covariant LeaderboardController notifier,
  ) {
    return notifier.build(
      quizId: quizId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
