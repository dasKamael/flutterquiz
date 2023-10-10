// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard.service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leaderBoardServiceHash() =>
    r'282b097024136592e2757263abd323a30480d8f8';

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

abstract class _$LeaderBoardService
    extends BuildlessAutoDisposeAsyncNotifier<List<LeaderboardEntry>> {
  late final String quizId;

  FutureOr<List<LeaderboardEntry>> build({
    required String quizId,
  });
}

/// See also [LeaderBoardService].
@ProviderFor(LeaderBoardService)
const leaderBoardServiceProvider = LeaderBoardServiceFamily();

/// See also [LeaderBoardService].
class LeaderBoardServiceFamily
    extends Family<AsyncValue<List<LeaderboardEntry>>> {
  /// See also [LeaderBoardService].
  const LeaderBoardServiceFamily();

  /// See also [LeaderBoardService].
  LeaderBoardServiceProvider call({
    required String quizId,
  }) {
    return LeaderBoardServiceProvider(
      quizId: quizId,
    );
  }

  @override
  LeaderBoardServiceProvider getProviderOverride(
    covariant LeaderBoardServiceProvider provider,
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
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'leaderBoardServiceProvider';
}

/// See also [LeaderBoardService].
class LeaderBoardServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    LeaderBoardService, List<LeaderboardEntry>> {
  /// See also [LeaderBoardService].
  LeaderBoardServiceProvider({
    required this.quizId,
  }) : super.internal(
          () => LeaderBoardService()..quizId = quizId,
          from: leaderBoardServiceProvider,
          name: r'leaderBoardServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$leaderBoardServiceHash,
          dependencies: LeaderBoardServiceFamily._dependencies,
          allTransitiveDependencies:
              LeaderBoardServiceFamily._allTransitiveDependencies,
        );

  final String quizId;

  @override
  bool operator ==(Object other) {
    return other is LeaderBoardServiceProvider && other.quizId == quizId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<LeaderboardEntry>> runNotifierBuild(
    covariant LeaderBoardService notifier,
  ) {
    return notifier.build(
      quizId: quizId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
