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
      body: Center(
        child: Hero(
            tag: '1',
            child: Image.network(
                'http://img-fotki.yandex.ru/get/6442/16969765.eb/0_6f7ea_35b34dd8_M.png')),
      ),
    );
  }
}
