import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/enums/question_type.enum.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/screens/management/widgets/create_quiz/edit_quiz.controller.dart';
import 'package:flutterquiz/src/presentation/screens/management/widgets/create_quiz/widgets/edit_quiz_single_answer_card.dart';
import 'package:flutterquiz/src/presentation/screens/management/widgets/create_quiz/widgets/edit_quiz_title_card.dart';

class EditQuizView extends ConsumerWidget {
  const EditQuizView({super.key, required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(editQuizControllerProvider(quiz: quiz));
    return SingleChildScrollView(
      child: Column(
        children: [
          EditQuizTitleCard(quiz: quiz),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.questions?.length ?? 0,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return EditQuizSingleAnswerCard(
                quiz: state,
                question: state.questions![index],
                onRemoveQuestion: () {
                  ref.read(editQuizControllerProvider(quiz: quiz).notifier).removeQuestion(index: index);
                },
              );
            },
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
            onPressed: () {
              ref.read(editQuizControllerProvider(quiz: quiz).notifier).addQuestion(questionType: QuestionType.single);
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
  }
}
