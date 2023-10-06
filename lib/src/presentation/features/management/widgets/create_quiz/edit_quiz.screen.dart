import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/services/get_complete_quiz.service.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_loading.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/create_quiz/edit_quiz.controller.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/create_quiz/edit_quiz.view.dart';
import 'package:go_router/go_router.dart';

class EditQuizScreen extends ConsumerWidget {
  const EditQuizScreen({super.key, this.quizId});

  final String? quizId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDesktop = MediaQuery.of(context).size.width > 1000;
    return ref.watch(getCompleteQuizProvider(quizId: quizId)).when(
          data: (quiz) {
            ref.watch(editQuizControllerProvider(quiz: quiz));
            return Wrap(
              alignment: isDesktop ? WrapAlignment.center : WrapAlignment.start,
              runAlignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
              direction: isDesktop ? Axis.horizontal : Axis.vertical,
              children: [
                SizedBox(
                  width: 200,
                  height: isDesktop ? 600 : 50,
                  child: Expanded(
                    child: Wrap(
                      direction: isDesktop ? Axis.horizontal : Axis.vertical,
                      alignment: isDesktop ? WrapAlignment.spaceBetween : WrapAlignment.spaceBetween,
                      runAlignment: isDesktop ? WrapAlignment.spaceBetween : WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        SizedBox(
                          width: isDesktop ? 200 : null,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: theme.elevatedButtonTheme.style?.copyWith(
                              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                            ),
                            child: Text(
                              'Quiz erstellen',
                              style: theme.textTheme.labelMedium?.copyWith(color: kTextColorLight),
                            ),
                          ),
                        ),
                        Wrap(
                          runSpacing: 8,
                          spacing: 8,
                          children: [
                            SizedBox(
                              width: isDesktop ? 200 : null,
                              height: isDesktop ? 32 : null,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: theme.elevatedButtonTheme.style?.copyWith(
                                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                                ),
                                child: Text(
                                  'Verwerfen',
                                  style: theme.textTheme.labelMedium?.copyWith(color: kTextColorLight),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: isDesktop ? 200 : null,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await ref.read(editQuizControllerProvider(quiz: quiz).notifier).saveQuiz();

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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  width: isDesktop ? MediaQuery.of(context).size.width / 2 : MediaQuery.of(context).size.width - 20,
                  height: isDesktop ? MediaQuery.of(context).size.height : null,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kCardBorderRadius),
                    child: EditQuizView(quiz: quiz),
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) => ErrorWidget(error),
          loading: () => const UiLoading(),
        );
  }
}
