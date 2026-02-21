import 'package:shared_contracts/shared_contracts.dart';

import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';

class LoginUseCase {
  const LoginUseCase(this._repository);

  final AuthRepository _repository;

  Future<AuthSession> call(LoginCommand command) {
    return _repository.login(command);
  }
}
