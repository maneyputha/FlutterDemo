import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/commons/constants/routing_constants.dart';
import 'package:flutter_demo/logic/blocs/auth/login/login_bloc.dart';
import 'package:flutter_demo/logic/blocs/auth/register/register_bloc.dart';
import 'package:flutter_demo/presentation/screens/home/home.dart';
import 'package:flutter_demo/presentation/screens/login/login.dart';
import 'package:flutter_demo/presentation/screens/register/register.dart';

///Handles the generated routing of the app
///Created By - Manendra Ranathunga
///Created Date - 28.12.2021
class AppRouter {
  ///Initializing the relevant blocs
  final LoginBloc _login = LoginBloc();
  final RegisterBloc _register = RegisterBloc();

  ///Generates the material page on pused to
  ///Created By - Manendra Ranathunga
  ///Created Date - 30.12.2021
  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case startRoute:
        return MaterialPageRoute(builder: (_) => const Login());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const Login());
      case registerRoute:
        return MaterialPageRoute(
            builder: (_) =>

                ///Wraps the bloc provider inside the route so that it can be access from any of the provided routes.
                BlocProvider.value(value: _register, child: const Register()));
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

  ///Dispose the blocs on dispose called
  ///Created By - Manendra Ranathunga
  ///Created Date - 30.12.2021
  void dispose() {
    _login.close();
    _register.close();
  }
}
