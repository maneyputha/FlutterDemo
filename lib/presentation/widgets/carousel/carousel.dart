import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/screens/home/home_page/body.dart';

///Carousel related Custom Widgets
///Created By - Manendra Ranathunga
///Created Date - 29.12.2021
class CarouselWidgets {
  ///TODO load content via bloc later
  static List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  ///Gets a carousel given the images widget
  ///Params :
  ///context - BuildContext of the app.
  ///Returns:
  ///Widget - returns the requested carousel widget.
  ///Created By - Manendra Ranathunga
  ///Created Date - 29.12.2021
  Widget getCarousel(BuildContext context, Body homePageBody) {
    return CarouselSlider(
      items: imgList
          .map(
            (item) => Center(
              child: Image.network(
                item,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          autoPlay: true,
          onPageChanged: (index, reason) {
            homePageBody.carouselCurrentIndex = index;
          }),
    );
  }

  ///Gets a carousel given the images widget
  ///Params :
  ///context - BuildContext of the app.
  ///Returns:
  ///Widget - returns the requested carousel widget.
  ///Created By - Manendra Ranathunga
  ///Created Date - 29.12.2021
  ///TODO not working (updating) as the image changes
  static Widget getCarouselBottomDecoration(
      BuildContext context, Body homePageBody) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(imgList, (index, url) {
          return Container(
            width: 10.0,
            height: 10.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: homePageBody.carouselCurrentIndex == index
                  ? Colors.black
                  : Colors.grey,
            ),
          );
        }));
  }

  ///Returns a generic list of bulets for top image carousel
  ///Params :
  ///list - list.
  ///Returns:
  ///List<T> - returns an ordered generic list.
  ///Created By - Manendra Ranathunga
  ///Created Date - 29.12.2021
  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}
