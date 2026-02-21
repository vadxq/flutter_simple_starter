import '../../domain/entities/post_entity.dart';
import '../../domain/repositories/post_repository.dart';

class GetPostsUseCase {
  const GetPostsUseCase(this._repository);

  final PostRepository _repository;

  Future<List<PostEntity>> call() {
    return _repository.getPosts();
  }
}
