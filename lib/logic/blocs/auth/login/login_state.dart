import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_demo/commons/logic/common.dart';
import 'package:flutter_demo/logic/blocs/Forms/form_submission_state.dart';

///Login State
///Created By - Manendra Ranathunga
///Created Date - 26.12.2021
///Updated By - Manendra Ranathunga
///Updated Date - 28.12.2021
class LoginState {
  final String name;
  final String email;

  ///Verify the email validity
  bool get isValidEmail => Common.validateEmail(email);
  final String password;

  ///Verify the password validity
  bool get isValidPassword => password.isNotEmpty;

  final FormSubmissionState formState;

  ///Login State default constructor
  ///Params :
  ///email - email address of the user
  ///password - password of the user
  ///formState - form state is set to initial at the beginning
  ///Returns:
  ///LoginState - returns an LoginState object.
  ///Created By - Manendra Ranathunga
  ///Created Date - 26.12.2021
  ///Updated By - Manendra Ranathunga
  ///Updated Date - 28.12.2021
  LoginState(
      {this.name = '',
      this.email = '',
      this.password = '',
      this.formState = const InitialFormState()});

  ///Login State constructor that accepts nullable parameter and use the default
  ///values if the params are null
  ///Params :
  ///email ? - email address (nullable) of the user
  ///password ? - password (nullable) of the user
  ///formState ? - sets the form status as you go
  ///Returns:
  ///LoginState - returns an LoginState object.
  ///Created By - Manendra Ranathunga
  ///Created Date - 26.12.2021
  ///Updated By - Manendra Ranathunga
  ///Updated Date - 28.12.2021
  LoginState copyWith(
      {String? name,
      String? email,
      String? password,
      FormSubmissionState? newFomState}) {
    return LoginState(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        formState: newFomState ?? formState);
  }
}
