import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/presentation/theme/ui_theme.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/management/widgets/create_quiz/edit_quiz.controller.dart';

class EditSingleQuestion extends ConsumerStatefulWidget {
  const EditSingleQuestion({super.key, required this.question});

  final Question question;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditSingleQuestionState();
}

class _EditSingleQuestionState extends ConsumerState<EditSingleQuestion> {
  late List<TextEditingController> _answersControllers;
  final TextEditingController _explanationController = TextEditingController();
  final TextEditingController _explanationLinkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _answersControllers = widget.question.answers!.map((answer) => TextEditingController(text: answer.answer)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final Question question = widget.question;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(question.question, style: theme.textTheme.headlineMedium),
          const SizedBox(height: 8),
          ListView.separated(
            shrinkWrap: true,
            itemCount: _answersControllers.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final controller = _answersControllers[index];
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: question.answers![index].isCorrect,
                onChanged: (value) {},
                title: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(kCardBorderRadius),
                  child: TextFormField(controller: controller),
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              // TODO ADD ANSWER
              _answersControllers.add(TextEditingController());
              ref.read(editQuizControllerProvider().notifier).addAnswerToQuestion(question: question);
            },
            child: const Text('Add answer'),
          ),
          const SizedBox(height: 8),
          Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            child: TextFormField(
              controller: _explanationController,
              decoration: const InputDecoration(hintText: 'Explanation...'),
              maxLines: 4,
            ),
          ),
          const SizedBox(height: 8),
          Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            child: TextFormField(
              controller: _explanationLinkController,
              decoration: const InputDecoration(hintText: 'Explanation Link...'),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
