import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  quiz.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelLarge,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    RatingBar(
                      allowHalfRating: true,
                      ignoreGestures: true,
                      itemSize: 20,
                      initialRating: quiz.rating.toDouble(),
                      ratingWidget: RatingWidget(
                        full: const Icon(Icons.star, color: Colors.amber),
                        half: const Icon(Icons.star_half, color: Colors.amberAccent),
                        empty: const Icon(Icons.star_border, color: Colors.grey),
                      ),
                      onRatingUpdate: (value) {},
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${quiz.rating}',
                      style: theme.textTheme.labelMedium,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${quiz.userRatedCount})',
                      style: theme.textTheme.labelSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  quiz.description,
                  style: theme.textTheme.labelMedium,
                  maxLines: 3,
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
