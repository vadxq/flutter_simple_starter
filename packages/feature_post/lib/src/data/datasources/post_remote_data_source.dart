import 'package:shared_contracts/shared_contracts.dart';

class PostRemoteDataSource {
  const PostRemoteDataSource();

  Future<List<PostDto>> fetchPosts() async {
    await Future<void>.delayed(const Duration(milliseconds: 350));

    return const [
      PostDto(id: 1, title: '架构宣言', body: 'Single App + Modular Packages + Workspace'),
      PostDto(id: 2, title: '模块边界', body: '每个 feature 独立分层，跨模块只走 contracts'),
      PostDto(id: 3, title: '交付基线', body: '统一 format / analyze / test / ci'),
    ];
  }
}
