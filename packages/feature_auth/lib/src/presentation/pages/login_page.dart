import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_contracts/shared_contracts.dart';

import '../controllers/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({
    required this.onLoginSuccess,
    super.key,
  });

  final VoidCallback onLoginSuccess;

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _usernameController = TextEditingController(text: 'demo');
  final _passwordController = TextEditingController(text: '123456');

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider, (previous, next) {
      if (!mounted) {
        return;
      }

      if (previous?.valueOrNull == null && next.valueOrNull != null) {
        widget.onLoginSuccess();
      }

      if (next.hasError) {
        final message = next.error?.toString() ?? '登录失败';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    });

    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: '用户名'),
                enabled: !isLoading,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: '密码'),
                obscureText: true,
                enabled: !isLoading,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          final command = LoginCommand(
                            username: _usernameController.text,
                            password: _passwordController.text,
                          );
                          await ref
                              .read(authControllerProvider.notifier)
                              .login(command);
                        },
                  child: isLoading
                      ? const SizedBox.square(
                          dimension: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('登录'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
