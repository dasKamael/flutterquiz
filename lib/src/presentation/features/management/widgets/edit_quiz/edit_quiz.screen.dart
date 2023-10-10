import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_loading.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/edit_quiz/edit_quiz.controller.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/edit_quiz/widgets/add_question_dialog.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/edit_quiz/widgets/edit_quiz_multiple_answer_card.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/edit_quiz/widgets/edit_quiz_single_answer_card.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/edit_quiz/widgets/edit_quiz_title_card.dart';
import 'package:go_router/go_router.dart';

class EditQuizScreen extends ConsumerWidget {
  const EditQuizScreen({super.key, this.quizId});

  final String? quizId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return ref.watch(editQuizControllerProvider(quizId)).when(
          data: (quiz) {
            return Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: theme.elevatedButtonTheme.style?.copyWith(
                              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                            ),
                            child: Text(
                              'Quiz erstellen',
                              style: theme.textTheme.labelMedium?.copyWith(color: kTextColorLight),
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: theme.elevatedButtonTheme.style?.copyWith(
                              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                            ),
                            child: Text(
                              'Verwerfen',
                              style: theme.textTheme.labelMedium?.copyWith(color: kTextColorLight),
                            ),
                          ),
                          const SizedBox(width: 4),
                          ElevatedButton(
                            onPressed: () async {
                              await ref.read(editQuizControllerProvider(quiz.id).notifier).saveQuiz();

                              if (context.mounted) context.pop();
                            },
                            style: theme.elevatedButtonTheme.style?.copyWith(
                              backgroundColor: MaterialStateProperty.all(kSecondaryColor),
                            ),
                            child: Text(
                              'Speichern',
                              style: theme.textTheme.labelMedium?.copyWith(color: kTextColorLight),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              constraints: const BoxConstraints(maxWidth: 1000),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(kCardBorderRadius),
                                child: Column(
                                  children: [
                                    EditQuizTitleCard(quiz: quiz),
                                    const SizedBox(height: 16),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: quiz.questions?.length ?? 0,
                                      separatorBuilder: (context, index) => const SizedBox(height: 8),
                                      itemBuilder: (context, index) {
                                        switch (quiz.questions![index].type) {
                                          case 'single':
                                            return EditQuizSingleAnswerCard(
                                              quiz: quiz,
                                              question: quiz.questions![index],
                                              onRemoveQuestion: () {
                                                ref
                                                    .read(editQuizControllerProvider(quiz.id).notifier)
                                                    .removeQuestion(index: index);
                                              },
                                            );
                                          case 'multiple':
                                            return EditQuizMultipleAnswerCard(
                                              quiz: quiz,
                                              question: quiz.questions![index],
                                              onRemoveQuestion: () {
                                                ref
                                                    .read(editQuizControllerProvider(quiz.id).notifier)
                                                    .removeQuestion(index: index);
                                              },
                                            );
                                          default:
                                            return EditQuizSingleAnswerCard(
                                              quiz: quiz,
                                              question: quiz.questions![index],
                                              onRemoveQuestion: () {
                                                ref
                                                    .read(editQuizControllerProvider(quiz.id).notifier)
                                                    .removeQuestion(index: index);
                                              },
                                            );
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 8),
                                    FloatingActionButton(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AddQuestionDialogContent(quiz: quiz),
                                        );
                                      },
                                      child: const Icon(Icons.add),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) => ErrorWidget(error),
          loading: () => const UiLoading(),
        );
  }
}
