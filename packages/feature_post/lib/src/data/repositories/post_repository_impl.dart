import 'package:shared_contracts/shared_contracts.dart';

import '../../domain/entities/post_entity.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_local_data_source.dart';
import '../datasources/post_remote_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({
    required PostLocalDataSource localDataSource,
    required PostRemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  final PostLocalDataSource _localDataSource;
  final PostRemoteDataSource _remoteDataSource;

  @override
  Future<PostEntity?> getPostDetail(int id) async {
    final local = await _localDataSource.getPostDetail(id);
    if (local != null) {
      return _toEntity(local);
    }

    await syncPosts();
    final refreshed = await _localDataSource.getPostDetail(id);
    if (refreshed == null) {
      return null;
    }
    return _toEntity(refreshed);
  }

  @override
  Future<List<PostEntity>> getPosts() async {
    final local = await _localDataSource.getPosts();
    if (local.isNotEmpty) {
      return local.map(_toEntity).toList(growable: false);
    }

    await syncPosts();
    final refreshed = await _localDataSource.getPosts();
    return refreshed.map(_toEntity).toList(growable: false);
  }

  @override
  Future<void> syncPosts() async {
    final remote = await _remoteDataSource.fetchPosts();
    await _localDataSource.replaceAll(remote);
  }

  PostEntity _toEntity(PostDto dto) {
    return PostEntity(id: dto.id, title: dto.title, body: dto.body);
  }
}
