// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_answers.service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAnswersServiceHash() => r'753cb39fe02f157e6098ae948c1566a2087bf6d4';

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

abstract class _$GetAnswersService extends BuildlessAutoDisposeAsyncNotifier<List<Answer>> {
  late final String questionId;

  FutureOr<List<Answer>> build({
    required String questionId,
  });
}

/// See also [GetAnswersService].
@ProviderFor(GetAnswersService)
const getAnswersServiceProvider = GetAnswersServiceFamily();

/// See also [GetAnswersService].
class GetAnswersServiceFamily extends Family<AsyncValue<List<Answer>>> {
  /// See also [GetAnswersService].
  const GetAnswersServiceFamily();

  /// See also [GetAnswersService].
  GetAnswersServiceProvider call({
    required String questionId,
  }) {
    return GetAnswersServiceProvider(
      questionId: questionId,
    );
  }

  @override
  GetAnswersServiceProvider getProviderOverride(
    covariant GetAnswersServiceProvider provider,
  ) {
    return call(
      questionId: provider.questionId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'getAnswersServiceProvider';
}

/// See also [GetAnswersService].
class GetAnswersServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<GetAnswersService, List<Answer>> {
  /// See also [GetAnswersService].
  GetAnswersServiceProvider({
    required this.questionId,
  }) : super.internal(
          () => GetAnswersService()..questionId = questionId,
          from: getAnswersServiceProvider,
          name: r'getAnswersServiceProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$getAnswersServiceHash,
          dependencies: GetAnswersServiceFamily._dependencies,
          allTransitiveDependencies: GetAnswersServiceFamily._allTransitiveDependencies,
        );

  final String questionId;

  @override
  bool operator ==(Object other) {
    return other is GetAnswersServiceProvider && other.questionId == questionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, questionId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<Answer>> runNotifierBuild(
    covariant GetAnswersService notifier,
  ) {
    return notifier.build(
      questionId: questionId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
