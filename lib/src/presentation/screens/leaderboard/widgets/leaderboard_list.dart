import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/leaderboard/models/leaderboard_entry.dart';

class LeaderboardList extends ConsumerWidget {
  const LeaderboardList({super.key, required this.entries});

  final List<LeaderboardEntry> entries;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Card(
      child: Table(
        children: [
          TableRow(
            children: [
              Text('Rank', textAlign: TextAlign.start, style: theme.textTheme.headlineMedium),
              Text('Username', textAlign: TextAlign.start, style: theme.textTheme.headlineMedium),
              Text('Score', textAlign: TextAlign.start, style: theme.textTheme.headlineMedium),
            ],
          ),
          for (int i = 0; i < entries.length; i++)
            TableRow(
              children: [
                Text((i + 1).toString(), textAlign: TextAlign.start),
                Text(entries[i].username, textAlign: TextAlign.start),
                Text(entries[i].score.toString(), textAlign: TextAlign.start),
              ],
            ),
        ],
      ),
    );
  }
}
