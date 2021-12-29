import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/screens/home/body.dart';

///Home Widget
///Created By - Manendra Ranathunga
///Created Date - 16.12.2021
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(resizeToAvoidBottomInset: false, body: Body());
  }
}
