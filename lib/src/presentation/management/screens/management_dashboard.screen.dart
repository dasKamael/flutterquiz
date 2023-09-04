import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/common/theme/ui_theme.dart';
import 'package:flutterquiz/src/presentation/management/widgets/management_page_card.dart';
import 'package:flutterquiz/src/presentation/management/widgets/quiz_overview/quiz_overview.dart';

class ManagementDashboardScreen extends ConsumerStatefulWidget {
  const ManagementDashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ManagementDashboardScreenState();
}

class _ManagementDashboardScreenState extends ConsumerState<ManagementDashboardScreen> {
  late final PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _currentPage = 0;
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 600,
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    });
                  },
                  child: const Text('Übersicht'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    });
                  },
                  child: const Text('Quizzes'),
                ),
              ),
              const Spacer(),
              // if (_currentPage == 1) const CreateQuizSideNav(),
              // if (_currentPage == 1) const QuizOverviewSideNav(),
            ],
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 1000,
          height: 600,
          child: Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kCardBorderRadius),
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [
                  ManagementPageCard(
                    title: '',
                    child: Expanded(
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const QuizOverview(),
                  Container(
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
