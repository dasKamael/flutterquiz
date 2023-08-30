import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/common/utils/url_launcher.util.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/screens/quiz/quiz.controller.dart';
import 'package:flutterquiz/src/presentation/screens/quiz/quiz_score.controller.dart';
import 'package:go_router/go_router.dart';

class QuestionResultDialog extends ConsumerWidget {
  const QuestionResultDialog({super.key, required this.question, required this.answers});

  final Question question;
  final List<Answer> answers;

  void navigateToNextQuestion(BuildContext context, WidgetRef ref) {
    final List<Question> questions = ref.read(quizControllerProvider(quizId: question.quizId)).value!.questions!;
    final int questionIndex = questions.indexOf(question);
    if (questionIndex + 1 < questions.length) {
      context.go('/quiz/${question.quizId}/${questions[questionIndex + 1].id}');
      context.pop();
    } else {
      context.go('/quiz/${question.quizId}/result');
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (answers.every((answer) => answer.isCorrect)) {
        ref.read(quizScoreControllerProvider.notifier).incrementBy(value: 1);
      }
    });

    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (answers.every((answer) => answer.isCorrect))
                Text('Correct!', style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.green)),
              if (answers.any((answer) => !answer.isCorrect))
                Text('Incorrect!', style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.red)),
              const SizedBox(height: 16),
              Text(question.question, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 16),
              Text(question.explanation, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text('Next Question'),
                    onPressed: () {
                      navigateToNextQuestion(context, ref);
                    },
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    child: const Text('Explanation'),
                    onPressed: () => UrlLauncherUtil.openUrl(question.explanationLink, context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
