// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_quizzes_by_user_id.service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getQuizzesByUserIdHash() => r'4dea3eae5bc59de58fa96caed30f774d87726260';

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

abstract class _$GetQuizzesByUserId extends BuildlessAutoDisposeAsyncNotifier<List<Quiz>> {
  late final String userId;

  Future<List<Quiz>> build({
    required String userId,
  });
}

/// See also [GetQuizzesByUserId].
@ProviderFor(GetQuizzesByUserId)
const getQuizzesByUserIdProvider = GetQuizzesByUserIdFamily();

/// See also [GetQuizzesByUserId].
class GetQuizzesByUserIdFamily extends Family<AsyncValue<List<Quiz>>> {
  /// See also [GetQuizzesByUserId].
  const GetQuizzesByUserIdFamily();

  /// See also [GetQuizzesByUserId].
  GetQuizzesByUserIdProvider call({
    required String userId,
  }) {
    return GetQuizzesByUserIdProvider(
      userId: userId,
    );
  }

  @override
  GetQuizzesByUserIdProvider getProviderOverride(
    covariant GetQuizzesByUserIdProvider provider,
  ) {
    return call(
      userId: provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'getQuizzesByUserIdProvider';
}

/// See also [GetQuizzesByUserId].
class GetQuizzesByUserIdProvider extends AutoDisposeAsyncNotifierProviderImpl<GetQuizzesByUserId, List<Quiz>> {
  /// See also [GetQuizzesByUserId].
  GetQuizzesByUserIdProvider({
    required this.userId,
  }) : super.internal(
          () => GetQuizzesByUserId()..userId = userId,
          from: getQuizzesByUserIdProvider,
          name: r'getQuizzesByUserIdProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$getQuizzesByUserIdHash,
          dependencies: GetQuizzesByUserIdFamily._dependencies,
          allTransitiveDependencies: GetQuizzesByUserIdFamily._allTransitiveDependencies,
        );

  final String userId;

  @override
  bool operator ==(Object other) {
    return other is GetQuizzesByUserIdProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<List<Quiz>> runNotifierBuild(
    covariant GetQuizzesByUserId notifier,
  ) {
    return notifier.build(
      userId: userId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
