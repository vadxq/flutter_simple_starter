import '../entities/post_entity.dart';

abstract interface class PostRepository {
  Future<List<PostEntity>> getPosts();

  Future<PostEntity?> getPostDetail(int id);

  Future<void> syncPosts();
}
