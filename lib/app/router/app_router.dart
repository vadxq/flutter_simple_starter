import 'package:feature_auth/feature_auth.dart';
import 'package:feature_post/feature_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../shell/app_shell_scaffold.dart';
import '../shell/boot_page.dart';
import '../shell/home_tab_page.dart';
import '../shell/profile_tab_page.dart';
import 'app_routes.dart';
import 'route_access_policy.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: RoutePaths.boot,
    routes: [
      GoRoute(
        path: RoutePaths.boot,
        builder: (_, __) => const BootPage(),
      ),
      GoRoute(
        path: RoutePaths.login,
        builder: (context, _) => LoginPage(
          onLoginSuccess: () => context.go(RoutePaths.posts),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShellScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.home,
                builder: (_, __) => const HomeTabPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.posts,
                builder: (context, _) => PostListPage(
                  onTapPost: (id) => PostDetailRoute(id).push(context),
                ),
                routes: [
                  GoRoute(
                    path: ':id',
                    builder: (_, state) {
                      final raw = state.pathParameters['id'];
                      final id = int.tryParse(raw ?? '');
                      if (id == null) {
                        return const Scaffold(
                          body: Center(child: Text('无效的帖子 ID')),
                        );
                      }
                      return PostDetailPage(id: id);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.profile,
                builder: (_, __) => const ProfileTabPage(),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final isBoot = state.matchedLocation == RoutePaths.boot;
      final isLogin = state.matchedLocation == RoutePaths.login;
      final accessPolicy = RouteAccessPolicy.resolve(state.matchedLocation);

      final isInitializing =
          authState.isLoading && !authState.hasValue && !authState.hasError;
      final hasSession = authState.valueOrNull != null;

      if (isInitializing) {
        return isBoot ? null : RoutePaths.boot;
      }

      if (isBoot) {
        return hasSession ? RoutePaths.posts : RoutePaths.login;
      }

      if (!hasSession && accessPolicy == RouteAccess.authenticatedOnly) {
        return RoutePaths.login;
      }

      if (hasSession && isLogin) {
        return RoutePaths.posts;
      }

      return null;
    },
  );
});
