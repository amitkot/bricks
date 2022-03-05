import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/sample_feature/sample_feature.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/settings/settings.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/l10n/l10n.dart';

class App extends ConsumerWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      // Providing a `restorationScopeId` allows the `Navigator` built by the
      // `MaterialApp` to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code.
      ],
      // Use AppLocalizations to configure the correct application title
      // depending on the user's locale.
      //
      // The appTitle is defined in .arb files found in the localization
      // directory.
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      // Define a light and dark color theme.
      // Then, read the user's preferred `ThemeMode`
      // (light, dark, or system default) from the
      // `settingsProvider` to display the correct theme.
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ref.watch(settingsProvider).themeMode,
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SampleItemListPage(),
        routes: [
          GoRoute(
            path: 'sample_item',
            builder: (context, state) => const SampleItemDetailsPage(),
          ),
          GoRoute(
            path: 'settings',
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
    ],
  );
}
