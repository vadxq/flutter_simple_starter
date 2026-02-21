import 'package:flutter_test/flutter_test.dart';

import '../lib/feature_auth.dart';

void main() {
  test('AuthSession should be authenticated when accessToken is not empty', () {
    const session = AuthSession(userId: 1, username: 'demo', accessToken: 'token');

    expect(session.isAuthenticated, isTrue);
  });
}
