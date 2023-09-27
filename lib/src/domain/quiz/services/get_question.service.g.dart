// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_question.service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getQuestionServiceHash() => r'9423c9437fb0d529465537a1ce02603e5d91c714';

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

abstract class _$GetQuestionService extends BuildlessAutoDisposeAsyncNotifier<Question> {
  late final dynamic questionId;

  FutureOr<Question> build({
    required dynamic questionId,
  });
}

/// See also [GetQuestionService].
@ProviderFor(GetQuestionService)
const getQuestionServiceProvider = GetQuestionServiceFamily();

/// See also [GetQuestionService].
class GetQuestionServiceFamily extends Family<AsyncValue<Question>> {
  /// See also [GetQuestionService].
  const GetQuestionServiceFamily();

  /// See also [GetQuestionService].
  GetQuestionServiceProvider call({
    required dynamic questionId,
  }) {
    return GetQuestionServiceProvider(
      questionId: questionId,
    );
  }

  @override
  GetQuestionServiceProvider getProviderOverride(
    covariant GetQuestionServiceProvider provider,
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
  String? get name => r'getQuestionServiceProvider';
}

/// See also [GetQuestionService].
class GetQuestionServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<GetQuestionService, Question> {
  /// See also [GetQuestionService].
  GetQuestionServiceProvider({
    required this.questionId,
  }) : super.internal(
          () => GetQuestionService()..questionId = questionId,
          from: getQuestionServiceProvider,
          name: r'getQuestionServiceProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$getQuestionServiceHash,
          dependencies: GetQuestionServiceFamily._dependencies,
          allTransitiveDependencies: GetQuestionServiceFamily._allTransitiveDependencies,
        );

  final dynamic questionId;

  @override
  bool operator ==(Object other) {
    return other is GetQuestionServiceProvider && other.questionId == questionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, questionId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<Question> runNotifierBuild(
    covariant GetQuestionService notifier,
  ) {
    return notifier.build(
      questionId: questionId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
