import 'package:app_core/app_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app.dart';

Future<void> bootstrapApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  final errorPipeline = ErrorPipeline(reporter: ConsoleErrorReporter());
  errorPipeline.bindFlutterErrorHandlers(feature: 'single_app');

  runApp(const ProviderScope(child: App()));
}
