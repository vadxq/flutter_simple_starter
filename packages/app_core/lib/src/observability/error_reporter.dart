import 'error_event.dart';

abstract interface class ErrorReporter {
  Future<void> report(ErrorEvent event);
}

class ConsoleErrorReporter implements ErrorReporter {
  @override
  Future<void> report(ErrorEvent event) async {
    // ignore: avoid_print
    print(
      '[${event.feature}] fatal=${event.fatal} error=${event.error} stack=${event.stackTrace}',
    );
  }
}
