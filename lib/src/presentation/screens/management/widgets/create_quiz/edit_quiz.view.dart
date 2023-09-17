import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/enums/question_type.enum.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_complete_quiz.service.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_loading.dart';
import 'package:flutterquiz/src/presentation/screens/management/widgets/create_quiz/edit_quiz.controller.dart';
import 'package:flutterquiz/src/presentation/screens/management/widgets/create_quiz/widgets/edit_quiz_single_answer_card.dart';
import 'package:flutterquiz/src/presentation/screens/management/widgets/create_quiz/widgets/edit_quiz_title_card.dart';

class EditQuizView extends ConsumerStatefulWidget {
  const EditQuizView({super.key, this.quizId});

  final String? quizId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditQuizViewState();
}

class _EditQuizViewState extends ConsumerState<EditQuizView> {
  bool isPrivate = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ref.watch(getCompleteQuizProvider(quizId: widget.quizId)).when(
          data: (quiz) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  EditQuizTitleCard(title: quiz.title, description: quiz.createdBy, isPrivate: quiz.isPrivate),
                  const SizedBox(height: 16),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: quiz.questions!.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      return EditQuizSingleAnswerCard(
                        question: quiz.questions![index],
                        onRemoveQuestion: () {
                          ref
                              .read(editQuizControllerProvider(quizId: widget.quizId).notifier)
                              .removeQuestion(index: index);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  FloatingActionButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                    onPressed: () {
                      ref
                          .read(editQuizControllerProvider(quizId: widget.quizId).notifier)
                          .addQuestion(questionType: QuestionType.single);
                      // showDialog(
                      //   context: context,
                      //   builder: (context) => const AddQuestionDialogContent(),
                      // );
                    },
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
          error: (error, stackTrace) => ErrorWidget(error),
          loading: () => const UiLoading(),
        );
  }
}
