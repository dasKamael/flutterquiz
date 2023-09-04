import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/presentation/management/widgets/create_quiz/edit_quiz.controller.dart';
import 'package:flutterquiz/src/presentation/management/widgets/management_page_card.dart';
import 'package:flutterquiz/src/presentation/shared_widgets/loading.dart';

class EditQuizCard extends ConsumerStatefulWidget {
  const EditQuizCard({super.key, this.quizId});

  final String? quizId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditQuizCardState();
}

class _EditQuizCardState extends ConsumerState<EditQuizCard> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(editQuizControllerProvider(quizId: widget.quizId)).when(
          data: (quiz) {
            return const ManagementPageCard(
              title: '',
              child: Text('Hallo'),
            );
          },
          error: (error, stackTrace) => ErrorWidget(error),
          loading: () => const ManagementPageCard(
            title: '',
            child: Loading(),
          ),
        );
  }
}
