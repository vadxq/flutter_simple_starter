import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_simple_starter/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

import '../pages/detail_page.dart';
import '../pages/home_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: HomePage.routeLocation,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: HomePage.routeLocation,
        name: HomePage.routeName,
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: SplashPage.routeLocation,
        name: SplashPage.routeName,
        builder: (context, state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: DetailsPage.routeLocation,
        name: DetailsPage.routeName,
        builder: (context, state) {
          final id = state.pathParameters['id']!.toString();
          return DetailsPage(id, isNuclearCode: false, key: state.pageKey);
        },
      )
    ],
  );
});
