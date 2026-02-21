class AuthSession {
  const AuthSession({
    required this.userId,
    required this.username,
    required this.accessToken,
  });

  final int userId;
  final String username;
  final String accessToken;

  bool get isAuthenticated => accessToken.isNotEmpty;
}
