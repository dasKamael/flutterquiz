import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/authentication/services/auth.service.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_quizzes_by_user_id.service.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_app_error.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_loading.dart';
import 'package:flutterquiz/src/presentation/screens/management/widgets/management_page_card.dart';
import 'package:go_router/go_router.dart';

class QuizOverview extends ConsumerWidget {
  const QuizOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(authServiceProvider)!.id;
    return ManagementPageCard(
      title: '',
      child: ref.watch(getQuizzesByUserIdProvider(userId: userId)).when(
            data: (quizzes) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListView.separated(
                      itemCount: quizzes.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        return QuizOverviewListTile(index: index, quiz: quizzes[index]);
                      },
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        context.go('/management/edit-quiz');
                      },
                      child: const Text('Create Quiz'),
                    ),
                  ],
                ),
              );
            },
            error: (error, stackTrace) {
              return UiAppError(error: error);
            },
            loading: () => const UiLoading(),
          ),
    );
  }
}

class QuizOverviewListTile extends ConsumerWidget {
  const QuizOverviewListTile({super.key, required this.index, required this.quiz});

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
        SizedBox(
          height: 64,
          width: 40,
          child: InkWell(
            onTap: () => context.go('/management/edit-quiz/${quiz.id}'),
            child: const Expanded(
              child: Card(
                color: kPrimaryColor,
                child: Icon(Icons.edit),
              ),
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
