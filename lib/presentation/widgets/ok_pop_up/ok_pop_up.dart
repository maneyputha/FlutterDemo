import 'package:flutter/material.dart';

///Ok pop up Widget
///On click ok if navigate true then navigate to the stated widget
///Params :
///title - title of the popup
///message - message of the popup
///navigate - bool true/false if to navigate to another page
///widget - if navigate true ? then navigate to the stated widget
///Created By - Manendra Ranathunga
///Created Date - 16.12.2021
///Updated By - Manendra Ranathunga
///Updated Date - 28.12.2021
class OkPopUp extends StatefulWidget {
  final String title;
  final String message;
  final bool navigate;
  final String route;

  const OkPopUp(
      {Key? key,
      required this.title,
      required this.message,
      required this.navigate,
      required this.route})
      : super(key: key);

  @override
  _OkPopUpState createState() => _OkPopUpState();
}

class _OkPopUpState extends State<OkPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.title,
        key: const Key("PopupHead"),
      ),
      content: Text(widget.message, key: const Key("PopUpBody")),
      actions: <Widget>[
        TextButton(
          key: const Key("PopUpOkBtn"),
          onPressed: () => {
            ///Navigates to a page given the route
            if (widget.navigate) {Navigator.pushNamed(context, widget.route)}
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
