import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/edit_quiz/edit_quiz.controller.dart';

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

  @override
  void initState() {
    super.initState();
    question = widget.question;
    if (question.answers == null) answers = [];
    answers = question.answers!.toList();
    for (Answer answer in answers) {
      answerControllers.add(TextEditingController(text: answer.answer));
    }

    titleController.text = question.question;
    explanationController.text = question.explanation ?? '';
    explanationLinkController.text = question.explanationLink ?? '';
  }

  void setIsCorrectAndRemoveFromOldOne(int index) {
    setState(() {
      answers[index] = answers[index].copyWith(isCorrect: !answers[index].isCorrect);
    });
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ref.watch(editQuizControllerProvider(widget.quiz.id));
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            height: 32,
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
                  Expanded(
                    child: TextFormField(
                      controller: answerControllers[index],
                      style: theme.textTheme.bodySmall,
                      decoration: const InputDecoration(
                        hintText: 'Antwortmöglichkeit...',
                        contentPadding: EdgeInsets.all(16),
                      ),
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
                  Answer(answer: '', isCorrect: false, id: '', questionId: '', createdAt: DateTime.now()),
                ];
                answerControllers.add(TextEditingController(text: ''));
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
