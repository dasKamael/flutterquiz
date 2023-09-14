import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_elevated_button.dart';
import 'package:go_router/go_router.dart';

class OverviewQuizCard extends StatefulWidget {
  const OverviewQuizCard({super.key, required this.quiz});

  final Quiz quiz;

  @override
  State<OverviewQuizCard> createState() => _OverviewQuizCardState();
}

class _OverviewQuizCardState extends State<OverviewQuizCard> {
  bool isHoverdOn = false;
  @override
  Widget build(BuildContext context) {
    final quiz = widget.quiz;
    final theme = Theme.of(context);
    return InkWell(
      // If removed, the InkWell will not work with onHover
      onTap: () {
        context.go('/quiz/${quiz.id}');
      },
      onHover: (value) => setState(() => isHoverdOn = value),
      child: Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AutoSizeText(
                  quiz.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  quiz.description,
                  style: theme.textTheme.labelSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                if (isHoverdOn)
                  UiElevatedButton(
                    fullWidth: true,
                    isPrimary: true,
                    onPressed: () => context.go('/quiz/${quiz.id}'),
                    child: const Text('Open Quiz'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
