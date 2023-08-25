import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/models/quiz.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/quiz/quiz.controller.dart';
import 'package:go_router/go_router.dart';

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
              final List<Question> questions =
                  ref.read(quizControllerProvider(quizId: question.quizId)).value!.questions!;
              final int questionIndex = questions.indexOf(question);
              if (questionIndex + 1 < questions.length) {
                context.push('/quiz/${question.quizId}/${questions[questionIndex + 1].id}');
              } else {
                // TODO Navigate to result screen
              }
            },
          ),
        );
      },
    );
  }
}
