import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/world_map_screen.dart';
import '../../presentation/screens/level_list_screen.dart';
import '../../presentation/screens/quiz_screen.dart';
import '../../presentation/screens/result_screen.dart';
import '../../presentation/screens/house_screen.dart';
import '../../presentation/screens/stars_screen.dart';
import '../../presentation/screens/settings_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/world/:subject',
      name: 'world',
      builder: (context, state) {
        final subject = state.pathParameters['subject']!;
        return WorldMapScreen(subject: subject);
      },
    ),
    GoRoute(
      path: '/levels/:subject/:chapter',
      name: 'levels',
      builder: (context, state) {
        final subject = state.pathParameters['subject']!;
        final chapter = int.parse(state.pathParameters['chapter']!);
        return LevelListScreen(subject: subject, chapter: chapter);
      },
    ),
    GoRoute(
      path: '/quiz/:subject/:level',
      name: 'quiz',
      builder: (context, state) {
        final subject = state.pathParameters['subject']!;
        final level = int.parse(state.pathParameters['level']!);
        return QuizScreen(subject: subject, level: level);
      },
    ),
    GoRoute(
      path: '/result/:subject/:level',
      name: 'result',
      builder: (context, state) {
        final subject = state.pathParameters['subject']!;
        final level = int.parse(state.pathParameters['level']!);
        final stars = state.uri.queryParameters['stars'] ?? '0';
        return ResultScreen(
          subject: subject,
          level: level,
          stars: int.parse(stars),
        );
      },
    ),
    GoRoute(
      path: '/house',
      name: 'house',
      builder: (context, state) => const HouseScreen(),
    ),
    GoRoute(
      path: '/stars',
      name: 'stars',
      builder: (context, state) => const StarsScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
