import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    this.label,
    super.key,
  });

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            if (label != null) ...[
              const SizedBox(height: 12),
              Text(label!),
            ],
          ],
        ),
      ),
    );
  }
}
