import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/blocs/auth/login/login_bloc.dart';
import 'package:flutter_demo/presentation/screens/login/body.dart';

///Login Widget
///Created By - Manendra Ranathunga
///Created Date - 05.12.2021
///Updated By - Manendra Ranathunga
///Updated Date - 26.12.2021
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///BlocProvider will provide the relevant bloc to the widget context
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: WillPopScope(
            onWillPop: () async => false,
            child:
                const Scaffold(resizeToAvoidBottomInset: false, body: Body())));
  }
}
