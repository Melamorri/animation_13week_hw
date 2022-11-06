import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  final List<String>? imageUrls;
  final String? heroTag;

  const GalleryScreen(this.imageUrls, {Key? key, this.heroTag});

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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: List.generate(
                imageUrls!.length,
                (index) => (heroTag != null && index == 0)
                    ? Card(
                        child: SizedBox(
                          height: 200,
                          // placeholder - изображение, которое будет показано, пока
                          //наше изображение, которое мы передаем в параметр image,
                          //загружается из сети. После загрузки, placeholder плавно
                          //исчезнет, а image плавно появится на его месте.
                          child: Hero(
                            tag: heroTag!,
                            child: FadeInImage(
                                placeholder:
                                    AssetImage('assets/images/pooh.jpg'),
                                image: NetworkImage(imageUrls![index])),
                          ),
                        ),
                      )
                    : Card(
                        child: FadeInImage(
                            placeholder: AssetImage('assets/images/pooh.jpg'),
                            image: NetworkImage(imageUrls![index])),
                      )),
          ),
        ),
      ),
    );
  }
}
