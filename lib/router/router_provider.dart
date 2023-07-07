import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_simple_starter/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';
import 'routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: HomeRoute.path,
    debugLogDiagnostics: true,
    routes: [
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
    GoRoute(path: '/details/:id', builder: (context, state) => const HomePage()),
  ],
  );
});
