import 'package:shared_contracts/shared_contracts.dart';
import 'package:test/test.dart';

void main() {
  test('LoginCommand isValid should return true when username and password are not empty', () {
    const command = LoginCommand(username: 'demo', password: '123456');

    expect(command.isValid, isTrue);
  });
}
