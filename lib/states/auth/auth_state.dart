import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/http/http_service.dart';
import '../../pages/login/models/login.dart';
import '../storage/prefs.dart';
import 'token_state.dart';

part 'auth_state.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  AuthStateEnum build() {
    final token = ref.watch(tokenStateProvider);
    return token != null ? AuthStateEnum.authenticated : AuthStateEnum.unauthenticated;
  }

  Future<void> login(Login data) async {
    final prefsStorage = ref.read(prefsProvider).requireValue;
    final token = await ref.read(apiServiceProvider).login(data);
    prefsStorage.setString('token', token);
    ref
      // Invalidate the state so the auth state will be updated to authenticated.
      ..invalidateSelf()
      // Invalidate tokenStateProvider so the API service will use the new token.
      ..invalidate(tokenStateProvider)
      // Invalidate apiServiceProvider so the API service will use the new token.
      ..invalidate(apiServiceProvider);
  }

  void logout() {
    final prefsStorage = ref.read(prefsProvider).requireValue;
    prefsStorage.remove('token');
    ref
      ..invalidateSelf()
      ..invalidate(tokenStateProvider)
      ..invalidate(apiServiceProvider);
  }
}

/// The possible authentication states of the app.
enum AuthStateEnum {
  unknown(
    redirectPath: '/',
    allowedPaths: [
      '/',
    ],
  ),
  unauthenticated(
    redirectPath: '/login',
    allowedPaths: [
      '/',
      '/login',
    ],
  ),
  authenticated(
    redirectPath: '/posts',
    allowedPaths: [
      '/',
      '/posts',
      '/posts/:id',
      '/profile',
    ],
  );

  const AuthStateEnum({
    required this.redirectPath,
    required this.allowedPaths,
  });

  /// The target path to redirect when the current route is not allowed in this
  /// auth state.
  final String redirectPath;

  /// List of paths allowed when the app is in this auth state.
  final List<String> allowedPaths;
}
