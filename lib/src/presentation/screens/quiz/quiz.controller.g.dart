// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quizControllerHash() => r'1d273c7325d118bfb68d6d251be504afeef7ba3f';

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

abstract class _$QuizController extends BuildlessAsyncNotifier<Quiz> {
  late final String quizId;

  FutureOr<Quiz> build({
    required String quizId,
  });
}

/// See also [QuizController].
@ProviderFor(QuizController)
const quizControllerProvider = QuizControllerFamily();

/// See also [QuizController].
class QuizControllerFamily extends Family<AsyncValue<Quiz>> {
  /// See also [QuizController].
  const QuizControllerFamily();

  /// See also [QuizController].
  QuizControllerProvider call({
    required String quizId,
  }) {
    return QuizControllerProvider(
      quizId: quizId,
    );
  }

  @override
  QuizControllerProvider getProviderOverride(
    covariant QuizControllerProvider provider,
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
  String? get name => r'quizControllerProvider';
}

/// See also [QuizController].
class QuizControllerProvider
    extends AsyncNotifierProviderImpl<QuizController, Quiz> {
  /// See also [QuizController].
  QuizControllerProvider({
    required this.quizId,
  }) : super.internal(
          () => QuizController()..quizId = quizId,
          from: quizControllerProvider,
          name: r'quizControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$quizControllerHash,
          dependencies: QuizControllerFamily._dependencies,
          allTransitiveDependencies:
              QuizControllerFamily._allTransitiveDependencies,
        );

  final String quizId;

  @override
  bool operator ==(Object other) {
    return other is QuizControllerProvider && other.quizId == quizId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<Quiz> runNotifierBuild(
    covariant QuizController notifier,
  ) {
    return notifier.build(
      quizId: quizId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
