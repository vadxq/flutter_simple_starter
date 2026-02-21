import 'package:meta/meta.dart';

@immutable
class LoginCommand {
  const LoginCommand({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  bool get isValid => username.trim().isNotEmpty && password.trim().isNotEmpty;
}
