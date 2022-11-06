import 'package:flutter/material.dart';
import 'dart:math';

class Rotate extends StatefulWidget {
  const Rotate({super.key});

  @override
  State<Rotate> createState() => _RotateState();
}

class _RotateState extends State<Rotate> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: Image.asset(
            'assets/images/poohhoney.png',
            width: 200,
          ),
        );
      },
    );
  }
}
