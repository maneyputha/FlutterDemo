import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/commons/constants/routing_constants.dart';
import 'package:flutter_demo/presentation/router/app_router.dart';
import 'package:get_it/get_it.dart';

///Flutter Demo App
///Created By - Manendra Ranathunga
///Created Date - 02.12.2021
///Updated By - Manendra Ranathunga
///Updated Date - 28.12.2021
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ///injecting the firebase auth instance to the Get It locator
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  MyApp({Key? key}) : super(key: key);

  get startRoute => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final User firebaseUser = FirebaseAuth.instance.currentUser;

    return getPage(firebaseUser);
  }

  ///Handles the user persistence depending on the firebase user instance
  ///Created By - Manendra Ranathunga
  ///Created Date - 28.12.2021
  MaterialApp getPage(User? firebaseUser) {
    if (firebaseUser == null) {
      return MaterialApp(
          onGenerateRoute: _appRouter.onGenerateRoute,
          initialRoute: startRoute);
    } else {
      return MaterialApp(
          onGenerateRoute: _appRouter.onGenerateRoute, initialRoute: homeRoute);
    }
  }
}
