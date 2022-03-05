import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';

/// Provider behavior observer.
class AppProviderObserver extends ProviderObserver {
  const AppProviderObserver();

  static final _logger = Logger('State');

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    _logger.finer(
      '[${provider.name ?? provider.runtimeType}]\n'
      'value: $newValue\n',
    );
  }
}
