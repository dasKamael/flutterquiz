import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/features/management/widgets/quiz_overview/quiz_overview.dart';

class ManagementDashboardScreen extends ConsumerStatefulWidget {
  const ManagementDashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ManagementDashboardScreenState();
}

class _ManagementDashboardScreenState extends ConsumerState<ManagementDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 1000;
    final theme = Theme.of(context);

    return Column(
      children: [
        Text('Quizzes', style: theme.textTheme.headlineMedium),
        const SizedBox(height: 12),
        Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          width: isDesktop ? MediaQuery.of(context).size.width / 2 : MediaQuery.of(context).size.width - 20,
          height: 600,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            child: const QuizOverview(),
          ),
        ),
      ],
    );
  }
}
