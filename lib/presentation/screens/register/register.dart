import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/blocs/auth/register/register_bloc.dart';
import 'body.dart';

///Register Widget
///Created By - Manendra Ranathunga
///Created Date - 09.12.2021
///Updated By - Manendra Ranathunga
///Updated Date - 15.12.2021
class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///BlocProvider will provide the relevant bloc to the widget context
    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: Body(),
      ),
    );
  }
}
