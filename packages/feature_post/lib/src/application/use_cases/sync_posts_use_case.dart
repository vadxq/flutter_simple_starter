import '../../domain/repositories/post_repository.dart';

class SyncPostsUseCase {
  const SyncPostsUseCase(this._repository);

  final PostRepository _repository;

  Future<void> call() {
    return _repository.syncPosts();
  }
}
