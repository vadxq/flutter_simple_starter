import '../../domain/entities/post_entity.dart';
import '../../domain/repositories/post_repository.dart';

class GetPostDetailUseCase {
  const GetPostDetailUseCase(this._repository);

  final PostRepository _repository;

  Future<PostEntity?> call(int id) {
    return _repository.getPostDetail(id);
  }
}
