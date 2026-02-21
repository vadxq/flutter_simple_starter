import 'dart:convert';

import 'package:app_core/app_core.dart';
import 'package:shared_contracts/shared_contracts.dart';

class AuthLocalDataSource {
  AuthLocalDataSource({required SecureStore secureStore})
      : _secureStore = secureStore;

  static const _sessionKey = 'auth_session';

  final SecureStore _secureStore;

  Future<void> saveSession(AuthSessionDto dto) async {
    await _secureStore.write(_sessionKey, jsonEncode(dto.toJson()));
  }

  Future<AuthSessionDto?> readSession() async {
    final raw = await _secureStore.read(_sessionKey);
    if (raw == null || raw.isEmpty) {
      return null;
    }

    final map = jsonDecode(raw) as Map<String, dynamic>;
    return AuthSessionDto.fromJson(map);
  }

  Future<void> clearSession() async {
    await _secureStore.delete(_sessionKey);
  }
}
