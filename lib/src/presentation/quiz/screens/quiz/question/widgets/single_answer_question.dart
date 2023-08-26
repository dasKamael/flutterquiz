import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/models/quiz.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/quiz/question/question_result.dialog.dart';

class SingleAnswerQuestion extends ConsumerWidget {
  const SingleAnswerQuestion({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: question.answers!.length,
      itemBuilder: (context, index) {
        return Center(
          child: ListTile(
            title: Text(question.answers![index].answer),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return QuestionResultDialog(
                    question: question,
                    answer: question.answers![index],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
