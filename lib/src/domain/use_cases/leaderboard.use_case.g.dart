// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard.use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leaderBoardUseCaseHash() =>
    r'50c02278b33ab74876dd0379fbe641ec9f883b00';

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

abstract class _$LeaderBoardUseCase
    extends BuildlessAutoDisposeAsyncNotifier<List<LeaderboardEntry>> {
  late final String quizId;

  FutureOr<List<LeaderboardEntry>> build({
    required String quizId,
  });
}

/// See also [LeaderBoardUseCase].
@ProviderFor(LeaderBoardUseCase)
const leaderBoardUseCaseProvider = LeaderBoardUseCaseFamily();

/// See also [LeaderBoardUseCase].
class LeaderBoardUseCaseFamily
    extends Family<AsyncValue<List<LeaderboardEntry>>> {
  /// See also [LeaderBoardUseCase].
  const LeaderBoardUseCaseFamily();

  /// See also [LeaderBoardUseCase].
  LeaderBoardUseCaseProvider call({
    required String quizId,
  }) {
    return LeaderBoardUseCaseProvider(
      quizId: quizId,
    );
  }

  @override
  LeaderBoardUseCaseProvider getProviderOverride(
    covariant LeaderBoardUseCaseProvider provider,
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
  String? get name => r'leaderBoardUseCaseProvider';
}

/// See also [LeaderBoardUseCase].
class LeaderBoardUseCaseProvider extends AutoDisposeAsyncNotifierProviderImpl<
    LeaderBoardUseCase, List<LeaderboardEntry>> {
  /// See also [LeaderBoardUseCase].
  LeaderBoardUseCaseProvider({
    required this.quizId,
  }) : super.internal(
          () => LeaderBoardUseCase()..quizId = quizId,
          from: leaderBoardUseCaseProvider,
          name: r'leaderBoardUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$leaderBoardUseCaseHash,
          dependencies: LeaderBoardUseCaseFamily._dependencies,
          allTransitiveDependencies:
              LeaderBoardUseCaseFamily._allTransitiveDependencies,
        );

  final String quizId;

  @override
  bool operator ==(Object other) {
    return other is LeaderBoardUseCaseProvider && other.quizId == quizId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<LeaderboardEntry>> runNotifierBuild(
    covariant LeaderBoardUseCase notifier,
  ) {
    return notifier.build(
      quizId: quizId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
