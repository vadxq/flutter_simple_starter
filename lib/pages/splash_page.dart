import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your phenomenal app')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Splash Page'),
            const Text("There's nothing much you can do, here"),
            ElevatedButton(
              onPressed: () => null,
              child: const Text('Button'),
            ),
          ],
        ),
      ),
    );
  }
}
