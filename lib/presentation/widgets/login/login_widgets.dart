import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/commons/constants/routing_constants.dart';
import 'package:flutter_demo/logic/blocs/auth/login/login_bloc.dart';
import 'package:flutter_demo/logic/blocs/auth/login/login_event.dart';
import 'package:flutter_demo/presentation/screens/register/register.dart';

///Login related Custom Widgets
///Created By - Manendra Ranathunga
///Created Date - 23.12.2021
class LoginWidgets {
  ///Gets the email text widget
  ///Params :
  ///_email - TextEditing controller for emails address.
  ///_focusNodeUsername - FocusNode for the given widget.
  ///context - BuildContext of the app.
  ///Returns:
  ///Widget - returns the requested username text widget.
  ///Created By - Manendra Ranathunga
  ///Created Date - 23.12.2021
  ///Updated By - Manendra Ranathunga
  ///Updated Date - 26.12.2021
  static Widget emailField(TextEditingController _email,
      FocusNode _focusNodeUsername, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          key: const Key('email'),
          decoration: const InputDecoration(
              icon: Icon(Icons.account_circle_rounded), hintText: 'Email'),
          controller: _email,
          focusNode: _focusNodeUsername,
          validator: (value) =>
              BlocProvider.of<LoginBloc>(context).state.isValidEmail
                  ? null
                  : 'Invalid Email.',
          onChanged: (value) => BlocProvider.of<LoginBloc>(context)
              .add(LoginEmailChanged(email: value)),
        ));
  }

  ///Gets the password text widget
  ///Params :
  ///_password - TextEditing controller for password address.
  ///_focusNodeUsername - FocusNode for the given widget.
  ///context - BuildContext of the app.
  ///Returns:
  ///Widget - returns the requested password text widget.
  ///Created By - Manendra Ranathunga
  ///Created Date - 23.12.2021
  ///Updated By - Manendra Ranathunga
  ///Updated Date - 27.12.2021
  static Widget passwordField(TextEditingController _password,
      FocusNode _focusNodePassword, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          key: const Key('password'),
          decoration: const InputDecoration(
              icon: Icon(Icons.lock), hintText: 'Password'),
          controller: _password,
          obscureText: true,
          focusNode: _focusNodePassword,
          validator: (value) =>
              BlocProvider.of<LoginBloc>(context).state.isValidPassword
                  ? null
                  : 'Password connot be empty.',
          onChanged: (value) => BlocProvider.of<LoginBloc>(context)
              .add(LoginPasswordChanged(password: value)),
        ));
  }

  ///Gets the submit button widget
  ///Params :
  ///_loginFormKey - GlobalKey including the form state.
  ///context - BuildContext of the app.
  ///Returns:
  ///Widget - returns the requested submit button widget.
  ///Created By - Manendra Ranathunga
  ///Created Date - 27.12.2021
  ///Updated By - Manendra Ranathunga
  ///Updated Date - 28.12.2021
  static Widget submitButton(
      GlobalKey<FormState> _loginFormKey, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          key: const Key('loginBtn'),
          style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(
                  40), // fromHeight use double.infinity as width and 40 is the height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              )),
          onPressed: () async {
            if (_loginFormKey.currentState!.validate()) {
              BlocProvider.of<LoginBloc>(context).add(LoginSubmitted(
                  email: BlocProvider.of<LoginBloc>(context).state.email,
                  password:
                      BlocProvider.of<LoginBloc>(context).state.password));
            }
          },
          child: const Text('Login'),
        ));
  }

  ///Gets the register button widget
  ///Params :
  ///context - BuildContext of the app.
  ///Returns:
  ///Widget - returns the requested register button widget.
  ///Created By - Manendra Ranathunga
  ///Created Date - 27.12.2021
  static Widget registerButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0.0),
        child: ElevatedButton(
          key: const Key('registerBtn'),
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              minimumSize: const Size.fromHeight(
                  40), // fromHeight use double.infinity as width and 40 is the height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              )),
          onPressed: () {
            Navigator.pushNamed(context, registerRoute);
          },
          child: const Text(
            'Register',
            style: TextStyle(color: Colors.black),
          ),
        ));
  }
}
