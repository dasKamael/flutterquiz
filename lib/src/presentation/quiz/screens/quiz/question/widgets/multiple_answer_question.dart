import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/common/theme/ui_theme.dart';
import 'package:flutterquiz/src/domain/models/quiz.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/quiz/question/question_result.dialog.dart';

class MultipleAnswerQuestion extends ConsumerWidget {
  const MultipleAnswerQuestion({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemCount: question.answers!.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return Center(
              child: Column(
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              String.fromCharCode(index + 65),
                              style: theme.textTheme.headlineLarge?.copyWith(color: kPrimaryColor),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              question.answers![index].answer,
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        ElevatedButton(
          style: theme.elevatedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(kSecondaryColor),
            textStyle: MaterialStateProperty.all<TextStyle>(theme.textTheme.labelMedium!.copyWith(color: Colors.white)),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return QuestionResultDialog(
                  question: question,
                  answer: question.answers![0],
                );
              },
            );
          },
          child: const Text('Submit'),
        )
      ],
    );
  }
}
