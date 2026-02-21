import 'package:shared_contracts/shared_contracts.dart';

class PostLocalDataSource {
  List<PostDto> _cache = const <PostDto>[];

  Future<List<PostDto>> getPosts() async {
    return _cache;
  }

  Future<PostDto?> getPostDetail(int id) async {
    for (final post in _cache) {
      if (post.id == id) {
        return post;
      }
    }
    return null;
  }

  Future<void> replaceAll(List<PostDto> posts) async {
    _cache = List<PostDto>.from(posts);
  }
}
