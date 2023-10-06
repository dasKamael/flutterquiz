import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/create_quiz/edit_quiz.controller.dart';

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

  @override
  void initState() {
    super.initState();
    question = widget.question;
    if (question.answers == null) answers = [];
    answers = question.answers!.toList();
  }

  void setIsCorrectAndRemoveFromOldOne(int index) {
    setState(() {
      answers[index] = answers[index].copyWith(isCorrect: !answers[index].isCorrect);
    });
  }

  void removeAnswerFromList(int index) {
    List<Answer> temp = answers;
    setState(() {
      temp.removeAt(index);
      answers = temp;
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
    ref.read(editQuizControllerProvider(quiz: widget.quiz).notifier).updateQuestion(question: question);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ref.watch(editQuizControllerProvider(quiz: widget.quiz));
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
                    initialValue: question.question,
                    style: theme.textTheme.bodyMedium,
                    decoration: const InputDecoration(
                      hintText: 'Fragestellung...',
                      contentPadding: EdgeInsets.all(16),
                    ),
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
                initialValue: question.explanation,
                style: theme.textTheme.bodySmall,
                decoration: InputDecoration(
                  hintText: 'Erklärung...',
                  hintStyle: theme.textTheme.bodySmall,
                ),
                onChanged: (value) => onExplanationChange(value),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: 40,
              child: TextFormField(
                initialValue: question.explanationLink,
                style: theme.textTheme.bodySmall,
                decoration: InputDecoration(
                  hintText: 'Erklärungslink...',
                  hintStyle: theme.textTheme.bodySmall,
                ),
                onChanged: (value) => onExplanationLinkChange(value),
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
                      initialValue: answers[index].answer,
                      style: theme.textTheme.bodySmall,
                      decoration: const InputDecoration(
                        hintText: 'Antwortmöglichkeit...',
                        contentPadding: EdgeInsets.all(16),
                      ),
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
