import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // use Future.delayed to simulate loading
    Future.delayed(const Duration(seconds: 3), () {
      // navigate to home
      // ref.read(goRouterProvider).go(RoutePath.home().routeLocation);
    });

    // return loading screen
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/splash.png', fit: BoxFit.cover),
      ),
    );
  }
}
