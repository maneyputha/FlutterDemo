import 'package:flutter/material.dart';

///Homepage Card Widget
///Created By - Manendra Ranathunga
///Created Date - 29.12.2021
class CardItem extends StatefulWidget {
  final String url;

  //Sets up the constructor and injects data in to the widget class from the body widget.
  const CardItem({Key? key, this.url = ''}) : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: Row(children: [
                  ClipOval(
                    child: Image.asset(
                      widget.url,
                      //Sets up the width and height based on the screen width and height.
                      height: MediaQuery.of(context).size.width * 0.1,
                      width: MediaQuery.of(context).size.width * 0.1,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(' Name',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('description')
                      ],
                    ),
                  )
                ])),
            //use of widget variables similar to this.url
            Image.asset(widget.url)
          ])),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(10),
    ));
  }
}
