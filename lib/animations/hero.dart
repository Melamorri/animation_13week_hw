import 'package:animation_13week/gallery_screen.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HeroAn extends StatefulWidget {
  const HeroAn({super.key});

  @override
  State<HeroAn> createState() => _HeroAnState();
}

class _HeroAnState extends State<HeroAn> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Hero(
            tag: "1",
            child: FadeInImage.memoryNetwork(
                fadeInDuration: const Duration(seconds: 3),
                placeholder: kTransparentImage,
                width: 150,
                image:
                    'http://img-fotki.yandex.ru/get/6442/16969765.eb/0_6f7ea_35b34dd8_M.png'),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GalleryScreen(),
                ),
              );
            },
            child: Text('Show me BIGGER pic'),
          ),
        ]),
      ),
    );
  }
}
