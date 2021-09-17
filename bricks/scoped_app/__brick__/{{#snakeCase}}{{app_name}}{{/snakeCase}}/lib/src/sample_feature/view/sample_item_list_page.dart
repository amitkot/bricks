import 'package:flutter/material.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/generated/assets.gen.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/sample_feature/sample_feature.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/settings/settings.dart';

/// {@template sample_item_list_page}
/// Displays a list of `SampleItems`.
/// {@endtemplate}
class SampleItemListPage extends StatelessWidget {
  /// {@macro sample_item_list_page}
  const SampleItemListPage({
    Key? key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  }) : super(key: key);

  /// Page's named route.
  static const routeName = '/';

  /// `SampleItem` list to be displayed.
  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items,
      // it’s best to use the `ListView.builder` constructor.
      //
      // In contrast to the default `ListView` constructor, which requires
      // building all Widgets up front, the `ListView.builder` constructor
      // lazily builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after
        // it has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
            title: Text('SampleItem ${item.id}'),
            leading: CircleAvatar(
              // Display the Flutter Logo image asset.
              foregroundImage: AssetImage(
                Assets.images.flutterLogo.assetName,
              ),
            ),
            onTap: () {
              // Navigate to the details page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(
                context,
                SampleItemDetailsPage.routeName,
              );
            },
          );
        },
      ),
    );
  }
}
