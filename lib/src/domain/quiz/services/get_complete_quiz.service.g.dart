// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_complete_quiz.service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCompleteQuizHash() => r'cf023e970e71f0f30031570b4bf024e602777cf8';

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

abstract class _$GetCompleteQuiz
    extends BuildlessAutoDisposeAsyncNotifier<Quiz> {
  late final String? quizId;

  FutureOr<Quiz> build({
    required String? quizId,
  });
}

/// See also [GetCompleteQuiz].
@ProviderFor(GetCompleteQuiz)
const getCompleteQuizProvider = GetCompleteQuizFamily();

/// See also [GetCompleteQuiz].
class GetCompleteQuizFamily extends Family<AsyncValue<Quiz>> {
  /// See also [GetCompleteQuiz].
  const GetCompleteQuizFamily();

  /// See also [GetCompleteQuiz].
  GetCompleteQuizProvider call({
    required String? quizId,
  }) {
    return GetCompleteQuizProvider(
      quizId: quizId,
    );
  }

  @override
  GetCompleteQuizProvider getProviderOverride(
    covariant GetCompleteQuizProvider provider,
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
  String? get name => r'getCompleteQuizProvider';
}

/// See also [GetCompleteQuiz].
class GetCompleteQuizProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GetCompleteQuiz, Quiz> {
  /// See also [GetCompleteQuiz].
  GetCompleteQuizProvider({
    required this.quizId,
  }) : super.internal(
          () => GetCompleteQuiz()..quizId = quizId,
          from: getCompleteQuizProvider,
          name: r'getCompleteQuizProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCompleteQuizHash,
          dependencies: GetCompleteQuizFamily._dependencies,
          allTransitiveDependencies:
              GetCompleteQuizFamily._allTransitiveDependencies,
        );

  final String? quizId;

  @override
  bool operator ==(Object other) {
    return other is GetCompleteQuizProvider && other.quizId == quizId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<Quiz> runNotifierBuild(
    covariant GetCompleteQuiz notifier,
  ) {
    return notifier.build(
      quizId: quizId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
