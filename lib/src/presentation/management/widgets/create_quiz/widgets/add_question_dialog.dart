import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_question_types.service.dart';
import 'package:flutterquiz/src/presentation/management/widgets/create_quiz/edit_quiz.controller.dart';
import 'package:go_router/go_router.dart';

class AddQuestionDialog extends ConsumerWidget {
  const AddQuestionDialog({super.key, this.quizId});

  final String? quizId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final types = ref.watch(getQuestionTypesServiceProvider);
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 300,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: types.value!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    ref
                        .read(editQuizControllerProvider(quizId: quizId).notifier)
                        .addQuestion(questionType: types.value![index]);
                    context.pop();
                  },
                  child: Center(
                    child: Text(types.value![index].name),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
