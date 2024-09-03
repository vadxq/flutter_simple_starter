import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'routes/routes.dart';
import 'states/storage/prefs.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // whenever your initialization is completed, remove the splash screen:
  // FlutterNativeSplash.remove();

  runApp(const ProviderScope(
    observers: [],
    child: _EagerInitialization(
      child: MainApp(),
    )
  ));
}


class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = [
      ref.watch(prefsProvider),
    ];
    if (values.every((value) => value.hasValue)) {
      return child;
    }
    return const Center(child: CircularProgressIndicator());
  }
}

class MainApp extends StatefulHookConsumerWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => MainAppState();
}

class MainAppState extends ConsumerState<MainApp> {
  @override
  void initState() {
    super.initState();
    // FlutterNativeSplash.remove();
  }
  @override
  Widget build(BuildContext context) {
    // Watch the GoRouter provider
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      // routeInformationParser: router.routeInformationParser,
      // routerDelegate: router.routerDelegate,
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
