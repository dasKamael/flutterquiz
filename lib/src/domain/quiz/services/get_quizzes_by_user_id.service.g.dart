// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_quizzes_by_user_id.service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getQuizzesByUserIdServiceHash() =>
    r'624ee17f4007ca87a9b03011dbb349e64a8632a2';

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

abstract class _$GetQuizzesByUserIdService
    extends BuildlessAutoDisposeAsyncNotifier<List<Quiz>> {
  late final String userId;

  Future<List<Quiz>> build({
    required String userId,
  });
}

/// See also [GetQuizzesByUserIdService].
@ProviderFor(GetQuizzesByUserIdService)
const getQuizzesByUserIdServiceProvider = GetQuizzesByUserIdServiceFamily();

/// See also [GetQuizzesByUserIdService].
class GetQuizzesByUserIdServiceFamily extends Family<AsyncValue<List<Quiz>>> {
  /// See also [GetQuizzesByUserIdService].
  const GetQuizzesByUserIdServiceFamily();

  /// See also [GetQuizzesByUserIdService].
  GetQuizzesByUserIdServiceProvider call({
    required String userId,
  }) {
    return GetQuizzesByUserIdServiceProvider(
      userId: userId,
    );
  }

  @override
  GetQuizzesByUserIdServiceProvider getProviderOverride(
    covariant GetQuizzesByUserIdServiceProvider provider,
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
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getQuizzesByUserIdServiceProvider';
}

/// See also [GetQuizzesByUserIdService].
class GetQuizzesByUserIdServiceProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GetQuizzesByUserIdService,
        List<Quiz>> {
  /// See also [GetQuizzesByUserIdService].
  GetQuizzesByUserIdServiceProvider({
    required this.userId,
  }) : super.internal(
          () => GetQuizzesByUserIdService()..userId = userId,
          from: getQuizzesByUserIdServiceProvider,
          name: r'getQuizzesByUserIdServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getQuizzesByUserIdServiceHash,
          dependencies: GetQuizzesByUserIdServiceFamily._dependencies,
          allTransitiveDependencies:
              GetQuizzesByUserIdServiceFamily._allTransitiveDependencies,
        );

  final String userId;

  @override
  bool operator ==(Object other) {
    return other is GetQuizzesByUserIdServiceProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<List<Quiz>> runNotifierBuild(
    covariant GetQuizzesByUserIdService notifier,
  ) {
    return notifier.build(
      userId: userId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
