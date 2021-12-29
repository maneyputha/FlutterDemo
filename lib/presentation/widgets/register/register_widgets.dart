import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/blocs/auth/register/register_bloc.dart';
import 'package:flutter_demo/logic/blocs/auth/register/register_event.dart';

///Register related Custom Widgets
///Created By - Manendra Ranathunga
///Created Date - 27.12.2021
class RegisterWidgets {
  ///Gets the email text widget
  ///Params :
  ///_email - TextEditing controller for emails address.
  ///_focusNodeUsername - FocusNode for the given widget.
  ///context - BuildContext of the app.
  ///Returns:
  ///Widget - returns the requested username text widget.
  ///Created By - Manendra Ranathunga
  ///Created Date - 27.12.2021
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
              BlocProvider.of<RegisterBloc>(context).state.isValidEmail
                  ? null
                  : 'Invalid Email.',
          onChanged: (value) => BlocProvider.of<RegisterBloc>(context)
              .add(RegisterEmailChanged(email: value)),
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
              BlocProvider.of<RegisterBloc>(context).state.isValidPassword
                  ? null
                  : 'Password connot be empty.',
          onChanged: (value) => BlocProvider.of<RegisterBloc>(context)
              .add(RegisterPasswordChanged(password: value)),
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
  static Widget submitButton(
      GlobalKey<FormState> _registerFormKey, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          key: const Key('registerBtn'),
          style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(
                  40), // fromHeight use double.infinity as width and 40 is the height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              )),
          onPressed: () async {
            if (_registerFormKey.currentState!.validate()) {
              BlocProvider.of<RegisterBloc>(context).add(RegisterSubmitted(
                  email: BlocProvider.of<RegisterBloc>(context).state.email,
                  password:
                      BlocProvider.of<RegisterBloc>(context).state.password));
            }
          },
          child: const Text('Register'),
        ));
  }
}
