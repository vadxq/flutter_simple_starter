import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/post_controller.dart';

class PostDetailPage extends ConsumerWidget {
  const PostDetailPage({
    required this.id,
    super.key,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postDetailProvider(id));

    return Scaffold(
      appBar: AppBar(title: Text('帖子 #$id')),
      body: state.when(
        data: (post) {
          if (post == null) {
            return const Center(child: Text('未找到帖子'));
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                Text(post.body),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('加载失败: $error')),
      ),
    );
  }
}
