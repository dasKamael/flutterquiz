import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/features/quiz/question/question_result.dialog.dart';

class SingleAnswerQuestion extends ConsumerWidget {
  const SingleAnswerQuestion({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: question.answers!.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return Center(
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return QuestionResultDialog(
                    question: question,
                    answers: [question.answers![index]],
                  );
                },
              );
            },
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Card(
                color: kSecondaryColor,
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        String.fromCharCode(index + 65),
                        style: theme.textTheme.headlineLarge,
                      ),
                      const SizedBox(width: 10),
                      if (question.answers![index].widgetType == 'text')
                        Text(
                          question.answers![index].answer,
                          style: theme.textTheme.bodySmall,
                        ),
                      if (question.answers![index].widgetType == 'code')
                        SyntaxView(
                          code: question.answers![index].answer,
                          syntax: Syntax.DART,
                          syntaxTheme: SyntaxTheme.vscodeDark(),
                          withZoom: false,
                          withLinesCount: true,
                          fontSize: theme.textTheme.bodySmall!.fontSize!,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
