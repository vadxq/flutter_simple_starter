import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';

class RestoreSessionUseCase {
  const RestoreSessionUseCase(this._repository);

  final AuthRepository _repository;

  Future<AuthSession?> call() {
    return _repository.restoreSession();
  }
}
