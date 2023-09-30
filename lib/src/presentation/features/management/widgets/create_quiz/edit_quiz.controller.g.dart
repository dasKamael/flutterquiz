// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_quiz.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editQuizControllerHash() =>
    r'85417a3566fd913f873a59ab75316f44042a242f';

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

abstract class _$EditQuizController extends BuildlessAutoDisposeNotifier<Quiz> {
  late final Quiz quiz;

  Quiz build({
    required Quiz quiz,
  });
}

/// See also [EditQuizController].
@ProviderFor(EditQuizController)
const editQuizControllerProvider = EditQuizControllerFamily();

/// See also [EditQuizController].
class EditQuizControllerFamily extends Family<Quiz> {
  /// See also [EditQuizController].
  const EditQuizControllerFamily();

  /// See also [EditQuizController].
  EditQuizControllerProvider call({
    required Quiz quiz,
  }) {
    return EditQuizControllerProvider(
      quiz: quiz,
    );
  }

  @override
  EditQuizControllerProvider getProviderOverride(
    covariant EditQuizControllerProvider provider,
  ) {
    return call(
      quiz: provider.quiz,
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
    extends AutoDisposeNotifierProviderImpl<EditQuizController, Quiz> {
  /// See also [EditQuizController].
  EditQuizControllerProvider({
    required this.quiz,
  }) : super.internal(
          () => EditQuizController()..quiz = quiz,
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

  final Quiz quiz;

  @override
  bool operator ==(Object other) {
    return other is EditQuizControllerProvider && other.quiz == quiz;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quiz.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Quiz runNotifierBuild(
    covariant EditQuizController notifier,
  ) {
    return notifier.build(
      quiz: quiz,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
