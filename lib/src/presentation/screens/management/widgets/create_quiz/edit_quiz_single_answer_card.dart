import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';

class EditQuizSingleAnswerCard extends ConsumerStatefulWidget {
  const EditQuizSingleAnswerCard({super.key, required this.question});

  final Question question;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditQuizSingleAnswerCardState();
}

class _EditQuizSingleAnswerCardState extends ConsumerState<EditQuizSingleAnswerCard> {
  List<Answer> answers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.question.answers == null) answers = [];
    answers = widget.question.answers!.toList();
  }

  void setIsCorrectAndRemoveFromOldOne(int index) {
    setState(() {
      answers = answers.map((e) {
        if (e.isCorrect) {
          return e.copyWith(isCorrect: false);
        }
        return e;
      }).toList();
      answers[index] = answers[index].copyWith(isCorrect: true);
    });
  }

  void removeAnswerFromList(int index) {
    List<Answer> temp = answers;
    setState(() {
      temp.removeAt(index);
    });

    answers = temp;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Question question = widget.question;
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            height: 16,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: question.question,
              style: theme.textTheme.bodyMedium,
              decoration: const InputDecoration(
                hintText: 'Question Title...',
                contentPadding: EdgeInsets.all(16),
              ),
            ),
          ),
          const Divider(indent: 20, endIndent: 20),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: answers.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Radio(
                    groupValue: true,
                    value: answers[index].isCorrect,
                    onChanged: (_) {
                      setIsCorrectAndRemoveFromOldOne(index);
                    },
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: answers[index].answer,
                      style: theme.textTheme.bodySmall,
                      decoration: const InputDecoration(
                        hintText: 'Answer...',
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      removeAnswerFromList(index);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
