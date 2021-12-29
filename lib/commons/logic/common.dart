import 'package:flutter/material.dart';

///Common screen functionalities
///Created By - Manendra Ranathunga
///Created Date - 05.12.2021
class Common {
  ///Gets colour given the hexadecimal code
  ///Params :
  ///hexColor - hexadecimal code for generating the required colour.
  ///Returns:
  ///Color - returns the requested Color object.
  ///Created By - Manendra Ranathunga
  ///Created Date - 05.12.2021
  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "").toLowerCase();
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }

    return Colors.white;
  }

  ///Check if whether a given email is valid
  ///Params :
  ///email - email address to be verified.
  ///Returns:
  ///bool - returns email validity.
  ///Created By - Manendra Ranathunga
  ///Created Date - 26.12.2021
  static bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
