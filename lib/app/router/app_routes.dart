import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final class RoutePaths {
  const RoutePaths._();

  static const String boot = '/boot';
  static const String login = '/login';
  static const String home = '/home';
  static const String posts = '/posts';
  static const String profile = '/profile';

  static String postDetail(int id) => '/posts/$id';
}

final class LoginRoute {
  const LoginRoute();

  String get location => RoutePaths.login;

  void go(BuildContext context) => context.go(location);
}

final class PostDetailRoute {
  const PostDetailRoute(this.id);

  final int id;

  String get location => RoutePaths.postDetail(id);

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);
}
