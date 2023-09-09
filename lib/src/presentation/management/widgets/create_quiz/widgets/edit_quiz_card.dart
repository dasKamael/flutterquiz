import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_loading.dart';
import 'package:flutterquiz/src/presentation/management/widgets/create_quiz/edit_quiz.controller.dart';
import 'package:flutterquiz/src/presentation/management/widgets/create_quiz/widgets/add_question_dialog.dart';
import 'package:flutterquiz/src/presentation/management/widgets/create_quiz/widgets/questions/edit_single_question.dart';
import 'package:flutterquiz/src/presentation/management/widgets/management_page_card.dart';

class EditQuizCard extends ConsumerStatefulWidget {
  const EditQuizCard({super.key, this.quizId});

  final String? quizId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditQuizCardState();
}

class _EditQuizCardState extends ConsumerState<EditQuizCard> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ManagementPageCard(
      title: '',
      child: ref.watch(editQuizControllerProvider(quizId: widget.quizId)).when(
            data: (quiz) {
              final List<Question> questions = quiz.questions ?? [];
              return Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: PageView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: questions.length,
                      itemBuilder: (context, index) {
                        final question = questions[index];
                        return EditSingleQuestion(question: question);
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: questions.length,
                          separatorBuilder: (context, index) => const SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 40,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await _pageController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                  setState(() {});
                                },
                                style: theme.elevatedButtonTheme.style?.copyWith(
                                  backgroundColor: MaterialStateProperty.all(
                                      index == _pageController.page ? kPrimaryColor : kCardColor),
                                ),
                                child: Text('${index + 1}',
                                    style: theme.textTheme.labelMedium?.copyWith(
                                        color: index == _pageController.page ? kTextColorLight : kPrimaryColor)),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AddQuestionDialog(quizId: widget.quizId),
                              );
                            },
                            child: const Text('+'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            error: (error, stackTrace) => ErrorWidget(error),
            loading: () => const UiLoading(),
          ),
    );
  }
}
