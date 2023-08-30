// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questionControllerHash() =>
    r'ac626458b5fed5f07c877f206ceac743c997889c';

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

abstract class _$QuestionController
    extends BuildlessAutoDisposeAsyncNotifier<Question> {
  late final dynamic quizId;
  late final dynamic questionId;

  FutureOr<Question> build({
    required dynamic quizId,
    required dynamic questionId,
  });
}

/// See also [QuestionController].
@ProviderFor(QuestionController)
const questionControllerProvider = QuestionControllerFamily();

/// See also [QuestionController].
class QuestionControllerFamily extends Family<AsyncValue<Question>> {
  /// See also [QuestionController].
  const QuestionControllerFamily();

  /// See also [QuestionController].
  QuestionControllerProvider call({
    required dynamic quizId,
    required dynamic questionId,
  }) {
    return QuestionControllerProvider(
      quizId: quizId,
      questionId: questionId,
    );
  }

  @override
  QuestionControllerProvider getProviderOverride(
    covariant QuestionControllerProvider provider,
  ) {
    return call(
      quizId: provider.quizId,
      questionId: provider.questionId,
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
  String? get name => r'questionControllerProvider';
}

/// See also [QuestionController].
class QuestionControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<QuestionController, Question> {
  /// See also [QuestionController].
  QuestionControllerProvider({
    required this.quizId,
    required this.questionId,
  }) : super.internal(
          () => QuestionController()
            ..quizId = quizId
            ..questionId = questionId,
          from: questionControllerProvider,
          name: r'questionControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$questionControllerHash,
          dependencies: QuestionControllerFamily._dependencies,
          allTransitiveDependencies:
              QuestionControllerFamily._allTransitiveDependencies,
        );

  final dynamic quizId;
  final dynamic questionId;

  @override
  bool operator ==(Object other) {
    return other is QuestionControllerProvider &&
        other.quizId == quizId &&
        other.questionId == questionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizId.hashCode);
    hash = _SystemHash.combine(hash, questionId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<Question> runNotifierBuild(
    covariant QuestionController notifier,
  ) {
    return notifier.build(
      quizId: quizId,
      questionId: questionId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
