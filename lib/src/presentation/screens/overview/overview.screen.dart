import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_quizzes.service.dart';
import 'package:flutterquiz/src/presentation/screens/overview/widgets/overview_rotation_header.dart';
import 'package:flutterquiz/src/presentation/shared_widgets/app_error.dart';
import 'package:flutterquiz/src/presentation/shared_widgets/loading.dart';
import 'package:go_router/go_router.dart';

class OverviewScreen extends ConsumerWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Container(
      child: ref.watch(getQuizzesServiceProvider).when(
            data: (quizzes) {
              if (quizzes.isEmpty) {
                return const Text('No quizzes');
              }
              return SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const OverviewRotationHeader(text: 'Flutter', angle: -0.1),
                      const OverviewRotationHeader(text: 'Quizzes', angle: 0.1),
                      const SizedBox(height: 100),
                      SizedBox(
                        width: isDesktop ? 300 : 200,
                        child: ListView.separated(
                          itemCount: quizzes.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => const SizedBox(height: 20),
                          itemBuilder: (context, index) {
                            final quiz = quizzes[index];
                            return SizedBox(
                              child: InkWell(
                                onTap: () => context.go('/quiz/${quiz.id}'),
                                child: Card(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            quiz.title,
                                            style: theme.textTheme.labelMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            loading: () => const Loading(),
            error: (error, _) => AppError(error: error),
          ),
    );
  }
}
