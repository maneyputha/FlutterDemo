import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/commons/constants/routing_constants.dart';
import 'package:flutter_demo/logic/blocs/Forms/form_submission_state.dart';
import 'package:flutter_demo/logic/blocs/auth/login/login_bloc.dart';
import 'package:flutter_demo/logic/blocs/auth/login/login_state.dart';
import 'package:flutter_demo/presentation/widgets/custom_snack_bar/custom_snack_bar.dart';
import 'package:flutter_demo/presentation/widgets/loading_pup_up/loading_pop_up.dart';
import 'package:flutter_demo/presentation/widgets/login/login_widgets.dart';
import 'package:flutter_demo/commons/logic/common.dart';

///Login Body Widget
///Created By - Manendra Ranathunga
///Created Date - 05.12.2021
///Updated By - Manendra Ranathunga
///Updated Date - 30.12.2021
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<Body> with SingleTickerProviderStateMixin {
  ///Animaitons are used inorder to update the position of the form card depending
  ///on the position of the the keypad.
  late AnimationController _controller;
  late Animation _animation;

  ///Focus nodes are used to handle the onclick focus element
  final FocusNode _focusNodeUsername = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

  @override
  void initState() {
    super.initState();

    ///Animation time is set to 200 milliseconds
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    ///Tween handles the animation heights before and after
    _animation = Tween(begin: 180.0, end: 50.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    ///Setup the listeners for handling the on click focus of a particular UI element
    _focusNodeUsername.addListener(() {
      if (_focusNodeUsername.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });

    _focusNodePassword.addListener(() {
      if (_focusNodePassword.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNodeUsername.dispose();
    _focusNodePassword.dispose();

    super.dispose();
  }

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  //Text editing contrllers help to manipulate dynamic text
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  ///Form key that includes the form state
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ///Setup the loading widget context
    ///Set it up here since it has to be declared outside the listner.
    BuildContext dialogContext = context;

    return Scaffold(
      resizeToAvoidBottomInset: false, // this avoids the overflow error
      body: InkWell(
        /// to dismiss the keyboard when the user tabs out of the TextField
        splashColor: Colors.transparent,

        ///Animation is reverted when click somewhere outside the focus nodes
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.blueAccent])),
          child: Column(
            children: <Widget>[
              ///Height of the sized box will change depending on the height of the animation
              SizedBox(height: _animation.value),
              Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: IntrinsicHeight(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                        Expanded(

                            ///The key purpose of a form is that it will help running the form validations.
                            child: BlocListener<LoginBloc, LoginState>(
                                listener: (context, state) {
                                  final formState = state.formState;
                                  if (formState is FormSubmitting) {
                                    ///Setup a loading widget on form submit
                                    showDialog<String>(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          dialogContext = context;
                                          return const LoadingPopUp();
                                        });
                                  } else if (formState is SubmissionFailed) {
                                    ///Show error snack bar.
                                    CustomSnackBarWidgets.showErrorSnackBar(
                                        context, formState.error);

                                    ///Removes the loading widget from current context
                                    Navigator.of(dialogContext,
                                            rootNavigator: true)
                                        .pop();
                                  }

                                  ///Navigates to home page if login success
                                  else if (formState is SubmissionSucces) {
                                    ///Removes the loading widget from current context
                                    Navigator.pop(dialogContext);
                                    Navigator.pushNamed(context, homeRoute);
                                  }
                                },
                                child: Form(
                                    key: _loginFormKey,
                                    child: Container(
                                        child: Column(children: [
                                          const Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                'Login',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24,
                                                    color: Colors.blueAccent,
                                                    fontFamily: 'Raleway'),
                                              )),

                                          /// loads the custom widgets.
                                          LoginWidgets.emailField(_email,
                                              _focusNodeUsername, context),
                                          LoginWidgets.passwordField(_password,
                                              _focusNodePassword, context),
                                          LoginWidgets.submitButton(
                                              _loginFormKey, context),
                                          LoginWidgets.registerButton(context)
                                        ]),
                                        color: Common.getColorFromHex(
                                            '#ececec')))))
                        // Expanded(child: Container(color: Colors.amber)),
                      ])),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 5,
                  margin: const EdgeInsets.all(10))
            ],
          ),
        ),
      ),
    );
  }
}
