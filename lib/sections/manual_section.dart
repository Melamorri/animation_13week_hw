import 'package:animation_13week/gallery_screen.dart';
import 'package:flutter/material.dart';

class ManualSection extends StatefulWidget {
  final List<String>? imageUrls;

  ManualSection({
    required this.imageUrls,
  });

  @override
  State<ManualSection> createState() => _ManualSectionState();
}

class _ManualSectionState extends State<ManualSection>
    with SingleTickerProviderStateMixin {
  bool show = false;

  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      //vsync — это аргумент, куда мы передаем контроллеру указатель на объект,
      //за которым он должен следить. Зачем это нужно? Чтобы анимация
      //воспроизводилась, только когда этот объект действительно виден на экране.
      //Это оптимизирует производительность, поскольку гарантирует, что мы
      //действительно анимируем только то, что видно пользователю.
      // Передадим в vsync указатель на объект состояния _SimpleSectionState при
      // помощи слова this. И для того, чтобы это заработало, еще нужно добавить
      // SingleTickerProviderStateMixin, расширяющий _SimpleSectionState. Именно
      // данный миксин* добавляет методы, которые позволяют контроллеру анимации
      // узнать, видим ли объект на экране, за которым он следит в данный момент

      duration: Duration(milliseconds: 500),
    );

// Анимация высоты настраивается с помощью класса`Tween`(between),который знает, как
//анимировать между двумя значениями. Т.к. мы будем анимировать высоту типа
//`double`, то укажем в `generic` (острые скобки <>) для `Animation` и`Tween`.
// Конструктор `Tween` имеет 2 аргумента: `begin` и `end`. Т.к мы анимируем
//появление, то `begin` укажем 0, а `end` 150.

// Сам по себе Tween не создает анимацию, он просто содержит информацию о том,
//как анимировать между двумя значениями. Чтобы создать анимированный объект на
//основе этого, нужно вызвать `animate()` и передать объект анимации.

    _heightAnimation = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
      //этот параметр определяет, как изменение нашей высоты будет распределено
      //во времени
    );
    _heightAnimation.addListener(() {
      setState(() {});
      //4. listener срабатывает при изменении значения, которое она “слушает”, на
      //нашу анимацию и вызывает setState() всякий раз, когда изменяется значение,
      // чтобы перерисовывать экран.
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    //5. обязательно закрывать контроллер при удалении виджета, чтобы
    //избежать утечек памяти. Сделаем это в методе dispose():
  }

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
                    //3.Теперь нам нужно запустить эту анимацию при помощи _controller
                    if (show == false) {
                      _controller.forward();
                      show = true;
                    } else {
                      _controller.reverse();
                      show = false;
                    }
                    // setState(() {
                    //   show = !show;
                    // });
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
            SizedBox(
              // 2. Итак, теперь у нас настроена анимация, которую нужно подключить
              // к нашему виджету в параметр height:
              height: _heightAnimation.value,
              width: 150,
              child: Image.network(widget.imageUrls![0]),
            ),
          ],
        ),
      ),
    );
  }
}
