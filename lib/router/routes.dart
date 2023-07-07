import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/detail_page.dart';
import '../pages/home_page.dart';

@TypedGoRoute<HomeRoute>(
  path: HomeRoute.path,
)
class HomeRoute extends GoRouteData {
  const HomeRoute();
  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

/// This route shows how to parametrize a simple page and how to pass a simple query parameter.
@TypedGoRoute<DetailsRoute>(path: DetailsRoute.path)
class DetailsRoute extends GoRouteData {
  const DetailsRoute(this.id, {this.isNuke = false});
  final int id;
  final bool isNuke;
  static const path = '/details/:id';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailsPage(
      id,
      isNuclearCode: isNuke,
    );
  }
}


