import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/enums/widget_type.enum.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/edit_quiz/edit_quiz.controller.dart';
// ignore: depend_on_referenced_packages
import 'package:highlight/languages/dart.dart';

class EditQuizMultipleAnswerCard extends ConsumerStatefulWidget {
  const EditQuizMultipleAnswerCard({
    super.key,
    required this.quiz,
    required this.question,
    required this.onRemoveQuestion,
  });

  final Quiz quiz;
  final Question question;
  final VoidCallback onRemoveQuestion;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditQuizMultipleAnswerCardState();
}

class _EditQuizMultipleAnswerCardState extends ConsumerState<EditQuizMultipleAnswerCard> {
  late Question question;
  List<Answer> answers = [];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController explanationController = TextEditingController();
  final TextEditingController explanationLinkController = TextEditingController();

  List<TextEditingController> answerControllers = [];
  List<CodeController> answerCodeControllers = [];

  WidgetType answersWidgetType = WidgetType.text;

  @override
  void initState() {
    super.initState();
    question = widget.question;
    if (question.answers == null) answers = [];

    answers = question.answers!.toList();
    if (question.answers != null) {
      answersWidgetType = WidgetType.fromString(question.answers!.first.widgetType);
    }
    for (Answer answer in answers) {
      answerControllers.add(TextEditingController(text: answer.answer));
      answerCodeControllers.add(
        CodeController(
          text: answer.answer,
          language: dart,
        ),
      );
    }

    titleController.text = question.question;
    explanationController.text = question.explanation;
    explanationLinkController.text = question.explanationLink;
  }

  List<DropdownMenuItem<WidgetType>> getWidgetTypes() {
    final List<DropdownMenuItem<WidgetType>> items = [];
    for (WidgetType type in WidgetType.values) {
      items.add(
        DropdownMenuItem(
          value: type,
          child: Text(type.name),
        ),
      );
    }
    return items;
  }

  void setIsCorrectAndRemoveFromOldOne(int index) {
    setState(() {
      answers[index] = answers[index].copyWith(isCorrect: !answers[index].isCorrect);
    });
  }

  void onAnswerChange(String value, int index) {
    List<Answer> temp = answers;
    temp[index] = temp[index].copyWith(answer: value);
    setState(() {
      answers = temp;
    });
    updateQuestion();
  }

  void removeAnswerFromList(int index) {
    setState(() {
      answers.removeAt(index);
      answerControllers.removeAt(index);
    });
  }

  void onExplanationChange(String value) {
    setState(() {
      question = question.copyWith(explanation: value);
    });
    updateQuestion();
  }

  void onExplanationLinkChange(String value) {
    setState(() {
      question = question.copyWith(explanationLink: value);
    });
    updateQuestion();
  }

  void updateQuestion() {
    question = question.copyWith(answers: answers);
    ref.read(editQuizControllerProvider(widget.quiz.id).notifier).updateQuestion(question: question);
  }

  void changeWidgetType(WidgetType widgetType) {
    if (widgetType == WidgetType.text) {
      for (int i = 0; i < answerCodeControllers.length; i++) {
        answerControllers[i].text = answerCodeControllers[i].text;
      }
    }
    if (widgetType == WidgetType.code) {
      for (int i = 0; i < answerCodeControllers.length; i++) {
        answerCodeControllers[i].text = answerControllers[i].text;
      }
    }

    setState(() {
      answersWidgetType = widgetType;
      answers = answers.map((e) => e.copyWith(widgetType: widgetType.name)).toList();

      answerControllers = answerControllers.map((e) {
        return TextEditingController(text: e.text);
      }).toList();
    });
    updateQuestion();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ref.watch(editQuizControllerProvider(widget.quiz.id));
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
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: theme.textTheme.bodyMedium,
                    decoration: const InputDecoration(
                      hintText: 'Fragestellung...',
                      contentPadding: EdgeInsets.all(16),
                    ),
                    onChanged: (value) {
                      setState(() {
                        question = question.copyWith(question: value);
                      });
                      updateQuestion();
                    },
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Es muss eine Fragestellung geben.';
                      return null;
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    widget.onRemoveQuestion();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: 40,
              child: TextFormField(
                style: theme.textTheme.bodySmall,
                decoration: InputDecoration(
                  hintText: 'Erklärung...',
                  hintStyle: theme.textTheme.bodySmall,
                ),
                onChanged: (value) => onExplanationChange(value),
                controller: explanationController,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Es muss eine Erklärung geben.';
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: 40,
              child: TextFormField(
                style: theme.textTheme.bodySmall,
                decoration: InputDecoration(
                  hintText: 'Erklärungslink...',
                  hintStyle: theme.textTheme.bodySmall,
                ),
                onChanged: (value) => onExplanationLinkChange(value),
                controller: explanationLinkController,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                if (question.answers!.isNotEmpty) Text('Antworttyp: ', style: theme.textTheme.bodySmall),
                const SizedBox(width: 8),
                if (question.answers!.isNotEmpty)
                  DropdownButton<WidgetType>(
                    items: getWidgetTypes(),
                    value: answersWidgetType,
                    onChanged: (value) => changeWidgetType(value!),
                  ),
              ],
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
                  Checkbox(
                    value: answers[index].isCorrect,
                    onChanged: (_) {
                      setIsCorrectAndRemoveFromOldOne(index);
                    },
                  ),
                  if (answersWidgetType == WidgetType.code)
                    Expanded(
                      child: CodeField(
                        controller: CodeController(
                          text: answers[index].answer,
                          language: dart,
                        ),
                        onChanged: (value) {
                          onAnswerChange(value, index);
                        },
                        textStyle: theme.textTheme.bodySmall!.copyWith(fontFamily: 'SourceCode'),
                      ),
                    ),
                  if (answersWidgetType == WidgetType.text)
                    Expanded(
                      child: TextFormField(
                        controller: answerControllers[index],
                        style: theme.textTheme.bodySmall,
                        decoration: const InputDecoration(
                          hintText: 'Antwortmöglichkeit...',
                          contentPadding: EdgeInsets.all(16),
                        ),
                        maxLines: null,
                        onChanged: (value) {
                          onAnswerChange(value, index);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Es darf keine leere Antwortmöglichkeit geben.';
                          if (answers.length < 2) return 'Es muss mindestens 2 Antwortmöglichkeiten geben.';

                          if (answers.every((element) => element.isCorrect == false)) {
                            return 'Es muss mindestens eine richtige Antwortmöglichkeit geben.';
                          }
                          return null;
                        },
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
          InkWell(
            onTap: () {
              setState(() {
                answers = [
                  ...answers,
                  Answer(
                    answer: '',
                    isCorrect: false,
                    id: '',
                    questionId: '',
                    createdAt: DateTime.now(),
                    widgetType: WidgetType.text.name,
                  ),
                ];
                answerControllers.add(TextEditingController(text: ''));
                answerCodeControllers.add(
                  CodeController(
                    text: '',
                    language: dart,
                  ),
                );
              });
            },
            child: IgnorePointer(
              child: Opacity(
                opacity: 0.4,
                child: Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (_) {},
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: 'Antwortmöglichkeit...',
                        style: theme.textTheme.bodySmall,
                        decoration: const InputDecoration(
                          hintText: 'Antwortmöglichkeit...',
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
