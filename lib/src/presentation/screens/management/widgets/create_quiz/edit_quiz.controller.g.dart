// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_quiz.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editQuizControllerHash() =>
    r'90e9d2ab05ce76351d22cd1816fd6f4b48c4616f';

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

abstract class _$EditQuizController
    extends BuildlessAutoDisposeAsyncNotifier<Quiz> {
  late final String? quizId;

  FutureOr<Quiz> build({
    String? quizId,
  });
}

/// See also [EditQuizController].
@ProviderFor(EditQuizController)
const editQuizControllerProvider = EditQuizControllerFamily();

/// See also [EditQuizController].
class EditQuizControllerFamily extends Family<AsyncValue<Quiz>> {
  /// See also [EditQuizController].
  const EditQuizControllerFamily();

  /// See also [EditQuizController].
  EditQuizControllerProvider call({
    String? quizId,
  }) {
    return EditQuizControllerProvider(
      quizId: quizId,
    );
  }

  @override
  EditQuizControllerProvider getProviderOverride(
    covariant EditQuizControllerProvider provider,
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
  String? get name => r'editQuizControllerProvider';
}

/// See also [EditQuizController].
class EditQuizControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<EditQuizController, Quiz> {
  /// See also [EditQuizController].
  EditQuizControllerProvider({
    this.quizId,
  }) : super.internal(
          () => EditQuizController()..quizId = quizId,
          from: editQuizControllerProvider,
          name: r'editQuizControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editQuizControllerHash,
          dependencies: EditQuizControllerFamily._dependencies,
          allTransitiveDependencies:
              EditQuizControllerFamily._allTransitiveDependencies,
        );

  final String? quizId;

  @override
  bool operator ==(Object other) {
    return other is EditQuizControllerProvider && other.quizId == quizId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<Quiz> runNotifierBuild(
    covariant EditQuizController notifier,
  ) {
    return notifier.build(
      quizId: quizId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
