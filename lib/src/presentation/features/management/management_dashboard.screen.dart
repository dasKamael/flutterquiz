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
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: isDesktop ? WrapAlignment.center : WrapAlignment.start,
      runAlignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
      direction: isDesktop ? Axis.horizontal : Axis.vertical,
      children: [
        SizedBox(
          width: 200,
          height: isDesktop ? 600 : 50,
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Quizzes'),
                ),
              ),
              // if (MediaQuery.of(context).size.width > 600) const Spacer(),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          width: isDesktop ? MediaQuery.of(context).size.width / 2 : MediaQuery.of(context).size.width - 20,
          height: 600,
          child: Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kCardBorderRadius),
              child: const QuizOverview(),
            ),
          ),
        ),
      ],
    );
  }
}
