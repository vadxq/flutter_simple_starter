import 'dart:ui';

import 'package:flutter/foundation.dart';

import 'error_event.dart';
import 'error_reporter.dart';

class ErrorPipeline {
  const ErrorPipeline({required this.reporter});

  final ErrorReporter reporter;

  void bindFlutterErrorHandlers({required String feature}) {
    FlutterError.onError = (FlutterErrorDetails details) {
      reporter.report(
        ErrorEvent(
          feature: feature,
          error: details.exception,
          stackTrace: details.stack ?? StackTrace.current,
          fatal: true,
        ),
      );
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      reporter.report(
        ErrorEvent(
          feature: feature,
          error: error,
          stackTrace: stack,
          fatal: true,
        ),
      );
      return true;
    };
  }
}
