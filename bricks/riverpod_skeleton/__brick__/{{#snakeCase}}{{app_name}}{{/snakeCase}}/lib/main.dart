import 'dart:async';

import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/app/app.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/app/app_provider_observer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:logs/logs.dart';

final _log = Logger('main');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logs().setupLogging(level: Level.FINER);

  FlutterError.onError = (details) {
    _log.severe(
      'Flutter Error: ${details.exceptionAsString()}',
      details.exception,
      details.stack,
    );
    FlutterError.dumpErrorToConsole(details);
  };

  runZonedGuarded(
    () => runApp(
      ProviderScope(
        observers: const [
          AppProviderObserver(),
        ],
        child: App(),
      ),
    ),
    (error, stackTrace) => _log.severe('Error: $error', error, stackTrace),
  );
}
