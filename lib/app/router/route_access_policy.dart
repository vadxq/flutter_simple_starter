import 'app_routes.dart';

enum RouteAccess {
  publicOnly,
  authenticatedOnly,
}

final class RouteAccessPolicy {
  const RouteAccessPolicy._();

  static RouteAccess resolve(String matchedLocation) {
    if (_isPublic(matchedLocation)) {
      return RouteAccess.publicOnly;
    }
    return RouteAccess.authenticatedOnly;
  }

  static bool _isPublic(String location) {
    return location == RoutePaths.boot || location == RoutePaths.login;
  }
}
