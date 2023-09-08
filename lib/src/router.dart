import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterquiz/src/presentation/design_system/layouts/default_layout.dart';
import 'package:flutterquiz/src/common/router/router_notifier.dart';
import 'package:flutterquiz/src/presentation/management/screens/management_dashboard.screen.dart';
import 'package:flutterquiz/src/presentation/management/widgets/create_quiz/edit_quiz.screen.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/leaderboard/leaderboard.screen.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/overview/overview.screen.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/quiz/question/question.screen.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/quiz/quiz.screen.dart';
import 'package:flutterquiz/src/presentation/quiz/screens/quiz/quiz_result.screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) {
  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: kDebugMode ? true : false,
    initialLocation: '/',
    refreshListenable: RouterNotifier(ref),
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return DefaultLayout(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const OverviewScreen()),
          ),
          // Quiz ######################################################################################################
          GoRoute(
            path: '/quiz/:quizId',
            pageBuilder: (context, state) {
              final quizId = state.pathParameters['quizId'] ?? '';
              return NoTransitionPage(
                key: state.pageKey,
                child: QuizScreen(quizId: quizId),
              );
            },
            routes: [
              GoRoute(
                path: 'result',
                pageBuilder: (context, state) {
                  final quizId = state.pathParameters['quizId'] ?? '';
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: QuizResultScreen(quizId: quizId),
                  );
                },
              ),
              GoRoute(
                path: 'leaderboard',
                pageBuilder: (context, state) {
                  final quizId = state.pathParameters['quizId'] ?? '';
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: LeaderboardScreen(quizId: quizId),
                  );
                },
              ),
              // TODO Build Shell Route around to smooth out the progressbar while navigating
              GoRoute(
                path: ':questionId',
                pageBuilder: (context, state) {
                  final quizId = state.pathParameters['quizId'] ?? '';
                  final questionId = state.pathParameters['questionId'] ?? '';
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: QuestionScreen(quizId: quizId, questionId: questionId),
                  );
                },
              ),
            ],
          ),
          // Management ################################################################################################
          GoRoute(
            path: '/management',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: const ManagementDashboardScreen(),
              );
            },
            routes: [
              GoRoute(
                path: 'edit-quiz',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: const EditQuizScreen(),
                  );
                },
              ),
              GoRoute(
                path: 'edit-quiz/:quizId',
                pageBuilder: (context, state) {
                  final quizId = state.pathParameters['quizId'] ?? '';
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: EditQuizScreen(quizId: quizId),
                  );
                },
              ),
            ],
          ),
        ],
      )
    ],
    redirect: (context, state) {
      return null;
    },
  );
  return router;
}
