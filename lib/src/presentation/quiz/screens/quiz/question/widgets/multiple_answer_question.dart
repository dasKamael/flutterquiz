import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/models/quiz.dart';

class MultipleAnswerQuestion extends ConsumerWidget {
  const MultipleAnswerQuestion({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: question.answers!.length,
      itemBuilder: (context, index) {
        return Center(
          child: CheckboxListTile(
            value: false,
            title: Text(question.answers![index].answer),
            onChanged: (value) {},
          ),
        );
      },
    );
  }
}
