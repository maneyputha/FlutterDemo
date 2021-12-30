import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/card/card.dart';
import 'package:flutter_demo/presentation/widgets/carousel/carousel.dart';

///Home Page Body Widget
///Created By - Manendra Ranathunga
///Created Date - 29.12.2021
class Body extends StatefulWidget {
  ///the current index of the video carousel.
  int carouselCurrentIndex = 0;
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late ScrollController controller;
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    loadData();
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blueAccent, Colors.white])),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 10),
                CarouselWidgets().getCarousel(context, widget),
                const SizedBox(height: 10),
                CarouselWidgets.getCarouselBottomDecoration(context, widget),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 250, minHeight: 56.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ListView.builder(
                key: const Key('homeScroller'),
                shrinkWrap: true,
                controller: controller,
                itemBuilder: (context, index) {
                  // return Text(items[index]);

                  return CardItem(url: items[index]);
                },
                itemCount: items.length,
              );
            },
            itemCount: 15,
          ),
        ),
      ],
    );

    // Container(child: Image.asset('assets/images/logo.png'),)
  }

  void loadData() {
    items.addAll(List.generate(10, (index) => 'assets/images/logo.png'));
  }

  void _scrollListener() {
    // print(controller.position.extentAfter);
    if (controller.position.extentAfter < 150) {
      setState(() {
        items.add('assets/images/logo.png');
        // items.addAll(List.generate(42, (index) => 'Inserted $index'));
      });
    }
  }
}
