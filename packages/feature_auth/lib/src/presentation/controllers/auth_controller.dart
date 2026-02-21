import 'package:app_core/app_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_contracts/shared_contracts.dart';

import '../../application/use_cases/login_use_case.dart';
import '../../application/use_cases/logout_use_case.dart';
import '../../application/use_cases/restore_session_use_case.dart';
import '../../data/datasources/auth_local_data_source.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final local = AuthLocalDataSource(secureStore: FlutterSecureStore());
  const remote = AuthRemoteDataSource();
  return AuthRepositoryImpl(localDataSource: local, remoteDataSource: remote);
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.read(authRepositoryProvider));
});

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  return LogoutUseCase(ref.read(authRepositoryProvider));
});

final restoreSessionUseCaseProvider = Provider<RestoreSessionUseCase>((ref) {
  return RestoreSessionUseCase(ref.read(authRepositoryProvider));
});

final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthSession?>(AuthController.new);

class AuthController extends AsyncNotifier<AuthSession?> {
  @override
  Future<AuthSession?> build() async {
    return ref.read(restoreSessionUseCaseProvider).call();
  }

  Future<void> login(LoginCommand command) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(loginUseCaseProvider).call(command),
    );
  }

  Future<void> logout() async {
    await ref.read(logoutUseCaseProvider).call();
    state = const AsyncData(null);
  }

  bool get isAuthenticated => state.valueOrNull?.isAuthenticated ?? false;
}
