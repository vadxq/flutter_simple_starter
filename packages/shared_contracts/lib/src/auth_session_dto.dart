import 'package:meta/meta.dart';

@immutable
class AuthSessionDto {
  const AuthSessionDto({
    required this.userId,
    required this.username,
    required this.accessToken,
  });

  factory AuthSessionDto.fromJson(Map<String, dynamic> json) {
    return AuthSessionDto(
      userId: (json['userId'] as num).toInt(),
      username: json['username'] as String,
      accessToken: json['accessToken'] as String,
    );
  }

  final int userId;
  final String username;
  final String accessToken;

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'accessToken': accessToken,
    };
  }
}
