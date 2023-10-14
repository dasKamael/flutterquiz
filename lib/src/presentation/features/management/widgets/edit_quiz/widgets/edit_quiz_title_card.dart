import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/edit_quiz/edit_quiz.controller.dart';

class EditQuizTitleCard extends ConsumerStatefulWidget {
  const EditQuizTitleCard({super.key, required this.quiz});

  final Quiz quiz;

  @override
  ConsumerState<EditQuizTitleCard> createState() => _EditQuizTitleCardState();
}

class _EditQuizTitleCardState extends ConsumerState<EditQuizTitleCard> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.quiz.title;
    descriptionController.text = widget.quiz.description;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            height: 32,
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
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Quiz Titel',
                contentPadding: EdgeInsets.all(16),
              ),
              onChanged: (value) =>
                  ref.read(editQuizControllerProvider(widget.quiz.id).notifier).updateQuizTitle(value),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Es muss einen Titel geben.';
                return null;
              },
            ),
          ),
          const Divider(indent: 20, endIndent: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: descriptionController,
              style: theme.textTheme.bodySmall,
              decoration: const InputDecoration(
                hintText: 'Quiz beschreibung',
                contentPadding: EdgeInsets.all(16),
              ),
              onChanged: (value) =>
                  ref.read(editQuizControllerProvider(widget.quiz.id).notifier).updateQuizDescription(value),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Es muss eine Beschreibung geben.';
                return null;
              },
            ),
          ),
          SwitchListTile(
            value: widget.quiz.isPrivate,
            onChanged: (value) {
              ref.read(editQuizControllerProvider(widget.quiz.id).notifier).toggleIsPrivate(value);
            },
            title: Text('Ist Privat', style: theme.textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
