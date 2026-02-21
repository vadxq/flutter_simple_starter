enum AppEnv {
  dev,
  staging,
  prod;

  static AppEnv fromDefine(String raw) {
    switch (raw.toLowerCase()) {
      case 'prod':
        return AppEnv.prod;
      case 'staging':
        return AppEnv.staging;
      case 'dev':
      default:
        return AppEnv.dev;
    }
  }
}

class AppConfig {
  const AppConfig({
    required this.env,
    required this.apiBaseUrl,
    required this.enableVerboseLog,
  });

  factory AppConfig.fromEnv(AppEnv env) {
    switch (env) {
      case AppEnv.dev:
        return const AppConfig(
          env: AppEnv.dev,
          apiBaseUrl: 'https://jsonplaceholder.typicode.com',
          enableVerboseLog: true,
        );
      case AppEnv.staging:
        return const AppConfig(
          env: AppEnv.staging,
          apiBaseUrl: 'https://jsonplaceholder.typicode.com',
          enableVerboseLog: true,
        );
      case AppEnv.prod:
        return const AppConfig(
          env: AppEnv.prod,
          apiBaseUrl: 'https://jsonplaceholder.typicode.com',
          enableVerboseLog: false,
        );
    }
  }

  final AppEnv env;
  final String apiBaseUrl;
  final bool enableVerboseLog;
}
