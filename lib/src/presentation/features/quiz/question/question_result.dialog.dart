import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:flutterquiz/src/common/utils/url_launcher.util.dart';
import 'package:flutterquiz/src/domain/quiz/enums/widget_type.enum.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/domain/quiz/services/create_edit_quiz.service.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_complete_quiz.service.dart';
import 'package:flutterquiz/src/domain/quiz/services/quiz_score.service.dart';
import 'package:go_router/go_router.dart';

class QuestionResultDialog extends ConsumerWidget {
  const QuestionResultDialog({super.key, required this.question, required this.answers});

  final Question question;
  final List<Answer> answers;

  void navigateToNextQuestion(BuildContext context, WidgetRef ref) {
    final List<Question> questions = ref.read(getCompleteQuizProvider(quizId: question.quizId)).value!.questions!;
    final int questionIndex = questions.indexOf(question);
    if (questionIndex + 1 < questions.length) {
      context.go('/quiz/${question.quizId}/${questions[questionIndex + 1].id}');
      context.pop();
    } else {
      ref.read(createEditQuizServiceProvider).incrementQuizCompletedCount(quizId: question.quizId);
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
    final theme = Theme.of(context);

    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (answers.every((answer) => answer.isCorrect))
                Text('Richtig!', style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.green)),
              if (answers.any((answer) => !answer.isCorrect))
                Text('Falsch!', style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.red)),
              const SizedBox(height: 16),
              Text(question.question, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 16),
              if (answers.any((answer) => !answer.isCorrect))
                Text('Die richtigen Antworten lauten:', style: Theme.of(context).textTheme.bodySmall),
              if (answers.any((answer) => !answer.isCorrect))
                for (final answer in question.answers!)
                  if (answer.isCorrect && answer.widgetType == WidgetType.text.name)
                    Text(answer.answer, style: Theme.of(context).textTheme.bodySmall)
                  else if (answer.isCorrect && answer.widgetType == WidgetType.code.name)
                    SyntaxView(
                      code: answer.answer,
                      syntax: Syntax.DART,
                      syntaxTheme: SyntaxTheme.vscodeDark(),
                      withZoom: false,
                      withLinesCount: true,
                      fontSize: theme.textTheme.bodySmall!.fontSize!,
                    ),
              const SizedBox(width: 200, child: Divider()),
              Text(question.explanation, style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text('Nächste Frage'),
                    onPressed: () {
                      navigateToNextQuestion(context, ref);
                    },
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    child: const Text('Erklärung'),
                    onPressed: () => UrlLauncherUtil.openUrl(question.explanationLink, context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
