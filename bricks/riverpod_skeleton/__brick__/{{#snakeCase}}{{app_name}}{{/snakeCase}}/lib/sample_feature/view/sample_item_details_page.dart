import 'package:flutter/material.dart';

class SampleItemDetailsPage extends StatelessWidget {
  const SampleItemDetailsPage({Key? key}) : super(key: key);

  /// Page's named route.
  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
