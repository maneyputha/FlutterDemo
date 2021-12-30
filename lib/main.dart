import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/commons/constants/routing_constants.dart';
import 'package:flutter_demo/presentation/router/app_router.dart';
import 'package:get_it/get_it.dart';

import 'logic/blocs/auth/login/login_bloc.dart';

///Flutter Demo App
///Created By - Manendra Ranathunga
///Created Date - 02.12.2021
///Updated By - Manendra Ranathunga
///Updated Date - 30.12.2021
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ///injecting the firebase auth instance to the Get It locator
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _myApptate createState() => _myApptate();
}

class _myApptate extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  get startRoute => null;

  @override
  Widget build(BuildContext context) {
    final User firebaseUser = FirebaseAuth.instance.currentUser;
    return getPage(firebaseUser);
  }

  ///Handles the user persistence depending on the firebase user instance
  ///Created By - Manendra Ranathunga
  ///Created Date - 28.12.2021
  BlocProvider getPage(User? firebaseUser) {
    ///BlocProvider will provide the relevant bloc to the entire app when injected to the material app
    ///Can use multi bloc provider to provide multiple blocs globally
    if (firebaseUser == null) {
      return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: MaterialApp(
            onGenerateRoute: _appRouter.onGenerateRoute,
            initialRoute: startRoute),
      );
    } else {
      return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: MaterialApp(
            onGenerateRoute: _appRouter.onGenerateRoute,
            initialRoute: homeRoute),
      );
    }
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
