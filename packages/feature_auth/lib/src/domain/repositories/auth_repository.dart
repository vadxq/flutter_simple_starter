import 'package:shared_contracts/shared_contracts.dart';

import '../entities/auth_session.dart';

abstract interface class AuthRepository {
  Future<AuthSession> login(LoginCommand command);

  Future<void> logout();

  Future<AuthSession?> restoreSession();
}
