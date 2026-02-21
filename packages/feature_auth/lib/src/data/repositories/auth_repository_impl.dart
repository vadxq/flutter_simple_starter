import 'package:shared_contracts/shared_contracts.dart';

import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthLocalDataSource localDataSource,
    required AuthRemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  final AuthLocalDataSource _localDataSource;
  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<AuthSession> login(LoginCommand command) async {
    final dto = await _remoteDataSource.login(command);
    await _localDataSource.saveSession(dto);
    return _toEntity(dto);
  }

  @override
  Future<void> logout() {
    return _localDataSource.clearSession();
  }

  @override
  Future<AuthSession?> restoreSession() async {
    final dto = await _localDataSource.readSession();
    if (dto == null) {
      return null;
    }
    return _toEntity(dto);
  }

  AuthSession _toEntity(AuthSessionDto dto) {
    return AuthSession(
      userId: dto.userId,
      username: dto.username,
      accessToken: dto.accessToken,
    );
  }
}
