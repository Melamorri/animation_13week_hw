import 'package:animation_13week/gallery_screen.dart';
import 'package:animation_13week/page2.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:transparent_image/transparent_image.dart';

class PageTransitionAn extends StatefulWidget {
  const PageTransitionAn({super.key});

  @override
  State<PageTransitionAn> createState() => _PageTransitionAnState();
}

class _PageTransitionAnState extends State<PageTransitionAn> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: PageTwo(), type: PageTransitionType.bottomToTop));
            },
            child: Text('Show me PAGE TRANSITION'),
          ),
        ]),
      ),
    );
  }
}
