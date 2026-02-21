import 'package:app_core/app_core.dart';
import 'package:shared_contracts/shared_contracts.dart';

class AuthRemoteDataSource {
  const AuthRemoteDataSource();

  Future<AuthSessionDto> login(LoginCommand command) async {
    await Future<void>.delayed(const Duration(milliseconds: 350));

    if (!command.isValid) {
      throw const AppError(code: 'AUTH_INVALID_INPUT', message: '用户名或密码不能为空');
    }

    return AuthSessionDto(
      userId: 1,
      username: command.username.trim(),
      accessToken: 'token_${DateTime.now().millisecondsSinceEpoch}',
    );
  }
}
