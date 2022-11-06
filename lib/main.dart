import 'package:flutter/material.dart';
import 'package:animation_13week/sections/container_section.dart';
import 'animations/rotate.dart';
import 'animations/hero.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rabbit\'s guests Animations'),
        ),
        body: Center(
          child: Column(children: [
            SizedBox(height: 20),
            Rotate(),
            SizedBox(height: 20),
            HeroAn(),
          ]),
        ),
      ),
    );
  }
}
