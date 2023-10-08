import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/edit_quiz/edit_quiz.controller.dart';

class EditQuizTitleCard extends ConsumerWidget {
  const EditQuizTitleCard({super.key, required this.quiz});

  final Quiz quiz;

  String missingTitle(WidgetRef ref) {
    final state = ref.read(editQuizControllerProvider(quiz.id)).value!;
    if (state.title.isEmpty) return 'Es muss ein Titel geben.';
    if (state.description.isEmpty) return 'Es muss eine Beschreibung geben.';
    return '';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(editQuizControllerProvider(quiz.id));

    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            height: 32,
            width: double.infinity,
            decoration: BoxDecoration(
              color: state.value!.title.isEmpty || state.value!.description.isEmpty ? kErrorColor : kPrimaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: AutoSizeText(
                missingTitle(ref),
                maxLines: 1,
                style: theme.textTheme.labelMedium!.copyWith(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: quiz.title,
              decoration: const InputDecoration(
                hintText: 'Quiz Titel',
                contentPadding: EdgeInsets.all(16),
              ),
              onChanged: (value) => ref.read(editQuizControllerProvider(quiz.id).notifier).updateQuizTitle(value),
            ),
          ),
          const Divider(indent: 20, endIndent: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: quiz.description,
              style: theme.textTheme.bodySmall,
              decoration: const InputDecoration(
                hintText: 'Quiz beschreibung',
                contentPadding: EdgeInsets.all(16),
              ),
              onChanged: (value) => ref.read(editQuizControllerProvider(quiz.id).notifier).updateQuizDescription(value),
            ),
          ),
          SwitchListTile(
            value: quiz.isPrivate,
            onChanged: (value) {
              ref.read(editQuizControllerProvider(quiz.id).notifier).toggleIsPrivate(value);
            },
            title: Text('Ist Privat', style: theme.textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
