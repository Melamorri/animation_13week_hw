import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  final String? heroTag;

  const GalleryScreen({Key? key, this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rabbit\'s guests Animations'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(),
    );
  }
}
