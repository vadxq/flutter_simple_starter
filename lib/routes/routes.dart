import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


import '../pages/detail/detail_page.dart';
import '../pages/home/home_page.dart';
import '../states/auth/auth_state.dart';
import '../widgets/scaffold_with_navigation.dart';

part 'routes.g.dart';

/// The router config for the app.
@riverpod
GoRouter router(RouterRef ref) {
  final authStateNotifier = ValueNotifier(AuthStateEnum.unknown);
  ref
    ..onDispose(authStateNotifier.dispose)
    ..listen(authStateProvider, (_, value) {
      authStateNotifier.value = value;
    });

  final navigationItems = [
    NavigationItem(
      path: '/',
      body: (_) => const HomePage(),
      icon: Icons.widgets_outlined,
      selectedIcon: Icons.widgets,
      label: 'home',
    ),
    NavigationItem(
      path: '/posts',
      body: (_) => const HomePage(),
      icon: Icons.article_outlined,
      selectedIcon: Icons.article,
      label: 'Posts',
      routes: [
        GoRoute(
          path: ':id',
          builder: (_, state) {
            final id = int.parse(state.pathParameters['id']!);
            return DetailsPage(id as String, isNuclearCode: false);
          },
        ),
      ],
    ),
    NavigationItem(
      path: '/profile',
      body: (_) => const HomePage(),
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
      label: 'Profile',
    ),
  ];

  final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: navigationItems.first.path,
    routes: [
      GoRoute(
        path: '/login',
        builder: (_, __) => const HomePage(),
      ),
      ShellRoute(
        builder: (_, __, child) => child,
        routes: [
          for (final (index, item) in navigationItems.indexed)
            GoRoute(
              path: item.path,
              pageBuilder: (context, _) => NoTransitionPage(
                child: ScaffoldWithNavigation(
                  selectedIndex: index,
                  navigationItems: navigationItems,
                  child: item.body(context),
                ),
              ),
              routes: item.routes,
            ),
        ],
      ),
    ],
    refreshListenable: authStateNotifier,
    redirect: (_, state) {
      try {
        final authState = ref.read(authStateProvider);
        if (!authState.allowedPaths.contains(state.fullPath)) {
          return authState.redirectPath;
        }
        return null;
      } catch (e) {
        print('Error checking authentication: $e');
        return null;
      }
    },
  );
  ref.onDispose(router.dispose);

  return router;
}
