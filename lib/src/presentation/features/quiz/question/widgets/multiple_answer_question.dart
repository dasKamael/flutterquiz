import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/features/quiz/question/question_result.dialog.dart';

class MultipleAnswerQuestion extends ConsumerStatefulWidget {
  const MultipleAnswerQuestion({super.key, required this.question});

  final Question question;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MultipleAnswerQuestionState();
}

class _MultipleAnswerQuestionState extends ConsumerState<MultipleAnswerQuestion> {
  final List<bool> _selected = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.question.answers!.length; i++) {
      _selected.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemCount: widget.question.answers!.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return Center(
              child: Column(
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Card(
                      color: kSecondaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CheckboxListTile(
                          value: _selected[index],
                          title: Row(
                            children: [
                              if (widget.question.answers![index].widgetType == 'text')
                                Text(
                                  widget.question.answers![index].answer,
                                  style: theme.textTheme.bodySmall,
                                ),
                              if (widget.question.answers![index].widgetType == 'code')
                                SyntaxView(
                                  code: widget.question.answers![index].answer,
                                  syntax: Syntax.DART,
                                  syntaxTheme: SyntaxTheme.vscodeDark(),
                                  withZoom: false,
                                  withLinesCount: true,
                                  fontSize: theme.textTheme.bodySmall!.fontSize!,
                                ),
                            ],
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {
                            setState(() {
                              _selected[index] = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: theme.elevatedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(kSecondaryColor),
          ),
          onPressed: _selected.any((element) => element == true)
              ? () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return QuestionResultDialog(
                        question: widget.question,
                        answers: widget.question.answers!
                            .where((element) => _selected[widget.question.answers!.indexOf(element)])
                            .toList(),
                      );
                    },
                  );
                }
              : null,
          child: const Text('Bestätigen'),
        ),
      ],
    );
  }
}
