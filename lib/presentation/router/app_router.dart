import 'package:flutter/material.dart';
import 'package:flutter_demo/commons/constants/routing_constants.dart';
import 'package:flutter_demo/presentation/screens/home/home.dart';
import 'package:flutter_demo/presentation/screens/login/login.dart';
import 'package:flutter_demo/presentation/screens/register/register.dart';

///Handles the generated routing of the app
///Created By - Manendra Ranathunga
///Created Date - 28.12.2021
class AppRouter {
  // final RegisterBloc _registerBloc = RegisterBloc();

  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case startRoute:
        return MaterialPageRoute(builder: (_) => const Login());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const Login());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => const Register());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const Home());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child:
                          Text('No route defined for ${routeSettings.name}')),
                ));
    }
  }
}
