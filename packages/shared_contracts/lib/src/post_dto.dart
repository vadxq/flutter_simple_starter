import 'package:meta/meta.dart';

@immutable
class PostDto {
  const PostDto({
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) {
    return PostDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  final int id;
  final String title;
  final String body;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
