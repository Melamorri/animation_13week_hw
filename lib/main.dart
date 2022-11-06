import 'package:flutter/material.dart';
import 'package:animation_13week/sections/simple_section.dart';
import 'package:animation_13week/sections/manual_section.dart';
import 'package:animation_13week/sections/builder_section.dart';
import 'package:animation_13week/sections/container_section.dart';
import 'animations/rotate.dart';

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
          ]),
        ),
      ),
    );
  }
}
