import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/management/services/create_edit_quiz.service.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_loading.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/edit_quiz/edit_quiz.controller.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/edit_quiz/widgets/add_question_dialog.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/edit_quiz/widgets/edit_quiz_multiple_answer_card.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/edit_quiz/widgets/edit_quiz_single_answer_card.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/edit_quiz/widgets/edit_quiz_title_card.dart';
import 'package:go_router/go_router.dart';

class EditQuizScreen extends ConsumerStatefulWidget {
  const EditQuizScreen({super.key, this.quizId});

  final String? quizId;

  @override
  ConsumerState<EditQuizScreen> createState() => _EditQuizScreenState();
}

class _EditQuizScreenState extends ConsumerState<EditQuizScreen> {
  final formKey = GlobalKey<FormState>();

  late final Future<String> quizId;

  @override
  void initState() {
    quizId = createQuiz();
    super.initState();
  }

  Future<String> createQuiz() async {
    if (widget.quizId == null) {
      final Quiz newQuiz = await ref.read(createEditQuizServiceProvider).createOrUpdateQuiz(
            quiz: Quiz(
              id: '',
              title: '',
              description: '',
              createdBy: '',
              rating: 0,
              userRatedCount: 0,
              createdAt: DateTime.now(),
              isPrivate: false,
              questions: [],
            ),
          );
      return newQuiz.id!;
    } else {
      return widget.quizId!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FutureBuilder<String>(
      future: quizId,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (!snapshot.hasData) return const UiLoading();
        return ref.watch(editQuizControllerProvider(snapshot.data)).when(
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
                                onPressed: () => context.pop(),
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
                                  if (formKey.currentState!.validate()) {
                                    final (success, value) =
                                        await ref.read(editQuizControllerProvider(snapshot.data).notifier).saveQuiz();

                                    if (value == 'no_questions') {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Es muss mindestens eine Frage vorhanden sein.'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Quiz erfolgreich gespeichert.'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                      if (context.mounted) context.pop();
                                    }
                                  }
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
                                    child: Form(
                                      key: formKey,
                                      child: Column(
                                        children: [
                                          EditQuizTitleCard(quiz: quiz),
                                          const SizedBox(height: 16),
                                          ListView.separated(
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount: quiz.questions?.length ?? 0,
                                            separatorBuilder: (context, index) => const SizedBox(height: 16),
                                            itemBuilder: (context, index) {
                                              switch (quiz.questions![index].type) {
                                                case 'single':
                                                  return EditQuizSingleAnswerCard(
                                                    quiz: quiz,
                                                    question: quiz.questions![index],
                                                    onRemoveQuestion: () {
                                                      ref
                                                          .read(
                                                            editQuizControllerProvider(snapshot.data).notifier,
                                                          )
                                                          .removeQuestion(index: index);
                                                    },
                                                  );
                                                case 'multiple':
                                                  return EditQuizMultipleAnswerCard(
                                                    quiz: quiz,
                                                    question: quiz.questions![index],
                                                    onRemoveQuestion: () {
                                                      ref
                                                          .read(
                                                            editQuizControllerProvider(snapshot.data).notifier,
                                                          )
                                                          .removeQuestion(index: index);
                                                    },
                                                  );
                                                default:
                                                  return EditQuizSingleAnswerCard(
                                                    quiz: quiz,
                                                    question: quiz.questions![index],
                                                    onRemoveQuestion: () {
                                                      ref
                                                          .read(
                                                            editQuizControllerProvider(snapshot.data).notifier,
                                                          )
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
      },
    );
  }
}
