import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class HomeTabPage extends StatelessWidget {
  const HomeTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: '首页',
      body: Center(child: Text('Single App 架构已启动')),
    );
  }
}
