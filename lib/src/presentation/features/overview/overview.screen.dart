import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_quizzes.service.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_app_error.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_loading.dart';
import 'package:flutterquiz/src/presentation/features/overview/widgets/overview_quiz_card.dart';

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
                return const Center(child: Text('Keine Quizze gefunden. Versuche es später nochmal.'));
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        AutoSizeText(
                          'Flutter Quiz',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.displayLarge,
                          maxLines: 1,
                          softWrap: false,
                          wrapWords: false,
                        ),
                        const SizedBox(height: 100),
                        SizedBox(
                          width: isDesktop ? 1000 : double.infinity,
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                            ),
                            itemCount: quizzes.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final quiz = quizzes[index];
                              return OverviewQuizCard(quiz: quiz);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            loading: () => const UiLoading(),
            error: (error, _) => UiAppError(error: error),
          ),
    );
  }
}
