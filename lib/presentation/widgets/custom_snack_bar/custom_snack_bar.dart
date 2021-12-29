import 'package:flutter/material.dart';

///Snack bar related Custom Widgets
///Created By - Manendra Ranathunga
///Created Date - 27.12.2021
class CustomSnackBarWidgets {
  ///Gets a custom error snack bar widget
  ///Params :
  ///context - BuildContext of the app.
  ///message - Message to be displayed.
  ///Returns:
  ///Widget - returns the requested submit button widget.
  ///Created By - Manendra Ranathunga
  ///Created Date - 27.12.2021
  static void showErrorSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
