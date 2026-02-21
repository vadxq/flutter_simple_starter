import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/use_cases/get_post_detail_use_case.dart';
import '../../application/use_cases/get_posts_use_case.dart';
import '../../application/use_cases/sync_posts_use_case.dart';
import '../../data/datasources/post_local_data_source.dart';
import '../../data/datasources/post_remote_data_source.dart';
import '../../data/repositories/post_repository_impl.dart';
import '../../domain/entities/post_entity.dart';
import '../../domain/repositories/post_repository.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) {
  final local = PostLocalDataSource();
  const remote = PostRemoteDataSource();
  return PostRepositoryImpl(localDataSource: local, remoteDataSource: remote);
});

final getPostsUseCaseProvider = Provider<GetPostsUseCase>((ref) {
  return GetPostsUseCase(ref.read(postRepositoryProvider));
});

final getPostDetailUseCaseProvider = Provider<GetPostDetailUseCase>((ref) {
  return GetPostDetailUseCase(ref.read(postRepositoryProvider));
});

final syncPostsUseCaseProvider = Provider<SyncPostsUseCase>((ref) {
  return SyncPostsUseCase(ref.read(postRepositoryProvider));
});

final postControllerProvider =
    AsyncNotifierProvider<PostController, List<PostEntity>>(PostController.new);

final postDetailProvider = FutureProvider.family<PostEntity?, int>((ref, id) {
  return ref.read(getPostDetailUseCaseProvider).call(id);
});

class PostController extends AsyncNotifier<List<PostEntity>> {
  @override
  Future<List<PostEntity>> build() {
    return ref.read(getPostsUseCaseProvider).call();
  }

  Future<void> refresh() async {
    await ref.read(syncPostsUseCaseProvider).call();
    state = await AsyncValue.guard(
      () => ref.read(getPostsUseCaseProvider).call(),
    );
  }
}
