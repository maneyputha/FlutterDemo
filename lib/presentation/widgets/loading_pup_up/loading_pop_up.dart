import 'package:flutter/material.dart';

///Loading pop up Widget
///Params :
///Created By - Manendra Ranathunga
///Created Date - 28.12.2021
class LoadingPopUp extends StatelessWidget {
  const LoadingPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: const CircularProgressIndicator()),
          const Text("Loading"),
        ],
      ),
    ));
  }
}
