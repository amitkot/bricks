import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/generated/assets.gen.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/sample_feature/sample_feature.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/settings/settings.dart';

class SampleItemListPage extends StatelessWidget {
  const SampleItemListPage({
    Key? key,
    this.items = const [
      SampleItem(1),
      SampleItem(2),
      SampleItem(3),
    ],
  }) : super(key: key);

  static const routeName = '/';

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
              context.go('/settings');
            },
          ),
        ],
      ),
      body: ListView.builder(
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
              context.go('/sample_item');
            },
          );
        },
      ),
    );
  }
}
