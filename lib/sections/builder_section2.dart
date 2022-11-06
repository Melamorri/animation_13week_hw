import 'package:animation_13week/gallery_screen.dart';
import 'package:flutter/material.dart';

class BuilderSection2 extends StatefulWidget {
  final List<String>? imageUrls;

  BuilderSection2({
    required this.imageUrls,
  });

  @override
  State<BuilderSection2> createState() => _BuilderSection2State();
}

class _BuilderSection2State extends State<BuilderSection2>
    with SingleTickerProviderStateMixin {
  bool show = false;

  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      show = !show;
                    });
                  },
                  child: Text(show ? 'Hide Guest' : 'Show Guest'),
                ),
                OutlinedButton(
                  child: Text('Show Gallery'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GalleryScreen(widget.imageUrls),
                      ),
                    );
                  },
                ),
              ],
            ),
            AnimatedBuilder(
              animation: _heightAnimation,
              child: Image.network(widget.imageUrls![0]),
              builder: ((context, child) {
                return SizedBox(
                  height: _heightAnimation.value,
                  width: 150,
                  child: child,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
