import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storage;

abstract interface class SecureStore {
  Future<void> write(String key, String value);

  Future<String?> read(String key);

  Future<void> delete(String key);
}

class FlutterSecureStore implements SecureStore {
  FlutterSecureStore()
      : _inner = const storage.FlutterSecureStorage(
          aOptions: storage.AndroidOptions(encryptedSharedPreferences: true),
          iOptions: storage.IOSOptions(
            accessibility: storage.KeychainAccessibility.first_unlock,
          ),
        );

  final storage.FlutterSecureStorage _inner;

  @override
  Future<void> delete(String key) {
    return _inner.delete(key: key);
  }

  @override
  Future<String?> read(String key) {
    return _inner.read(key: key);
  }

  @override
  Future<void> write(String key, String value) {
    return _inner.write(key: key, value: value);
  }
}
