import 'package:shared_preferences/shared_preferences.dart';

abstract interface class KvStore {
  Future<void> writeString(String key, String value);

  Future<String?> readString(String key);

  Future<void> remove(String key);
}

class SharedPrefsKvStore implements KvStore {
  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();

  @override
  Future<String?> readString(String key) {
    return _prefs.getString(key);
  }

  @override
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> writeString(String key, String value) async {
    await _prefs.setString(key, value);
  }
}
