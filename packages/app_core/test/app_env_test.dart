import 'package:flutter_test/flutter_test.dart';

import '../lib/app_core.dart';

void main() {
  test('AppEnv.fromDefine should fallback to dev for unknown value', () {
    final env = AppEnv.fromDefine('unknown');

    expect(env, AppEnv.dev);
  });
}
