import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('login page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('login Page'),
            const Text("There's nothing much you can do, here"),
            ElevatedButton(
              onPressed: () => (),
              child: const Text('Button'),
            ),
          ],
        ),
      ),
    );
  }
}
