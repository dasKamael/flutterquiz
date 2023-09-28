import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OverviewRotationHeader extends StatelessWidget {
  const OverviewRotationHeader({Key? key, required this.text, this.angle = 0.1}) : super(key: key);

  final String text;
  final double angle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Transform.rotate(
      angle: angle,
      child: isDesktop
          ? AutoSizeText(
              text,
              textAlign: TextAlign.center,
              style: theme.textTheme.displayLarge,
              maxLines: 1,
              softWrap: false,
              wrapWords: false,
            )
          : Text(
              text,
              textAlign: TextAlign.center,
              style: theme.textTheme.displayLarge?.copyWith(fontSize: 85),
              maxLines: 1,
              softWrap: false,
            ),
    );
  }
}
