import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/common/theme/ui_theme.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_quizzes.service.dart';
import 'package:flutterquiz/src/presentation/management/widgets/management_page_card.dart';
import 'package:flutterquiz/src/presentation/shared_widgets/app_error.dart';
import 'package:flutterquiz/src/presentation/shared_widgets/loading.dart';

class QuizOverview extends ConsumerWidget {
  const QuizOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ManagementPageCard(
      title: '',
      child: ref.watch(getQuizzesServiceProvider).when(
            data: (quizzes) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.separated(
                  itemCount: quizzes.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    return QuizOverviewWidget(index: index, quiz: quizzes[index]);
                  },
                ),
              );
            },
            error: (error, stackTrace) {
              return AppError(error: error);
            },
            loading: () => const Loading(),
          ),
    );
  }
}

class QuizOverviewWidget extends ConsumerWidget {
  const QuizOverviewWidget({super.key, required this.index, required this.quiz});

  final int index;
  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Card(
            margin: EdgeInsets.zero,
            color: index % 2 == 0 ? kPrimaryColor : kSecondaryColor,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(quiz.title, style: theme.textTheme.labelMedium?.copyWith(color: kTextColorLight)),
            ),
          ),
        ),
        const SizedBox(width: 8),
        const SizedBox(
          height: 64,
          width: 40,
          child: Expanded(
            child: Card(
              color: kPrimaryColor,
              child: Icon(Icons.edit),
            ),
          ),
        ),
        const SizedBox(width: 8),
        const SizedBox(
          height: 64,
          width: 40,
          child: Expanded(
            child: Card(
              color: kErrorColor,
              child: Icon(Icons.delete),
            ),
          ),
        ),
      ],
    );
  }
}
