import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/create_quiz/edit_quiz.controller.dart';

class EditQuizTitleCard extends ConsumerWidget {
  const EditQuizTitleCard({super.key, required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(editQuizControllerProvider(quiz: quiz));
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            height: 16,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: quiz.title,
              decoration: const InputDecoration(
                hintText: 'Quiz Title',
                contentPadding: EdgeInsets.all(16),
              ),
              onChanged: (value) => ref.read(editQuizControllerProvider(quiz: quiz).notifier).updateQuizTitle(value),
            ),
          ),
          const Divider(indent: 20, endIndent: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: quiz.description,
              style: theme.textTheme.bodySmall,
              decoration: const InputDecoration(
                hintText: 'Quiz Description',
                contentPadding: EdgeInsets.all(16),
              ),
              onChanged: (value) =>
                  ref.read(editQuizControllerProvider(quiz: quiz).notifier).updateQuizDescription(value),
            ),
          ),
          SwitchListTile(
            value: state.isPrivate,
            onChanged: (value) {
              ref.read(editQuizControllerProvider(quiz: quiz).notifier).toggleIsPrivate(value);
            },
            title: Text('Is private', style: theme.textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
