import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({
    Key? key,
  });

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
        child: Image.network(
            'https://www.pinkbus.ru/im/600x600/880119/0/3244394/jpeg1.jpg'),
      ),
    );
  }
}
