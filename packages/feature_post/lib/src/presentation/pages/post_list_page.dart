import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/post_controller.dart';

class PostListPage extends ConsumerWidget {
  const PostListPage({
    required this.onTapPost,
    super.key,
  });

  final ValueChanged<int> onTapPost;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('帖子'),
        actions: [
          IconButton(
            onPressed: () async {
              await ref.read(postControllerProvider.notifier).refresh();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: state.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const Center(child: Text('暂无数据'));
          }

          return ListView.separated(
            itemCount: posts.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(
                  post.body,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () => onTapPost(post.id),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('加载失败: $error')),
      ),
    );
  }
}
