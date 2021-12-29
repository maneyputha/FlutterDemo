import 'package:flutter_demo/commons/logic/common.dart';
import 'package:flutter_demo/logic/blocs/Forms/form_submission_state.dart';

///Register State
///Created By - Manendra Ranathunga
///Created Date - 26.12.2021
class RegisterState {
  final String email;

  ///Verify the email validity
  bool get isValidEmail => Common.validateEmail(email);
  final String password;

  ///Verify the password validity
  bool get isValidPassword => password.isNotEmpty;

  final FormSubmissionState formState;

  ///Register State default constructor
  ///Params :
  ///email - email address of the user
  ///password - password of the user
  ///formState - form state is set to initial at the beginning
  ///Returns:
  ///LoginState - returns an LoginState object.
  ///Created By - Manendra Ranathunga
  ///Created Date - 26.12.2021
  RegisterState(
      {this.email = '',
      this.password = '',
      this.formState = const InitialFormState()});

  ///Register State constructor that accepts nullable parameter and use the default
  ///values if the params are null
  ///Params :
  ///email ? - email address (nullable) of the user
  ///password ? - password (nullable) of the user
  ///formState ? - sets the form status as you go
  ///Returns:
  ///LoginState - returns an LoginState object.
  ///Created By - Manendra Ranathunga
  ///Created Date - 26.12.2021
  RegisterState copyWith(
      {String? email, String? password, FormSubmissionState? newFomState}) {
    return RegisterState(
        email: email ?? this.email,
        password: password ?? this.password,
        formState: newFomState ?? formState);
  }
}
