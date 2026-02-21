import 'package:app_core/app_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appEnvProvider = Provider<AppEnv>((ref) {
  final raw = const String.fromEnvironment('APP_ENV', defaultValue: 'dev');
  return AppEnv.fromDefine(raw);
});

final appConfigProvider = Provider<AppConfig>((ref) {
  final env = ref.watch(appEnvProvider);
  return AppConfig.fromEnv(env);
});

final kvStoreProvider = Provider<KvStore>((ref) {
  return SharedPrefsKvStore();
});

final secureStoreProvider = Provider<SecureStore>((ref) {
  return FlutterSecureStore();
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final config = ref.watch(appConfigProvider);
  return ApiClient(config: config);
});
