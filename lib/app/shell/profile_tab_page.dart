import 'package:design_system/design_system.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileTabPage extends ConsumerWidget {
  const ProfileTabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(authControllerProvider).valueOrNull;

    return AppScaffold(
      title: '我的',
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('当前用户：${session?.username ?? '未登录'}'),
            const SizedBox(height: 12),
            FilledButton.tonal(
              onPressed: () async {
                await ref.read(authControllerProvider.notifier).logout();
              },
              child: const Text('退出登录'),
            ),
          ],
        ),
      ),
    );
  }
}
