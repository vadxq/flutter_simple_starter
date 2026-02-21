import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart';

class BootPage extends StatelessWidget {
  const BootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLoading(label: '应用初始化中...');
  }
}
