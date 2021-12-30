import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/data/models/app_user.dart';
import 'package:flutter_demo/data/repositories/auth_repository.dart';
import 'package:flutter_demo/logic/blocs/Forms/form_submission_state.dart';
import 'package:flutter_demo/logic/blocs/auth/login/login_event.dart';
import 'package:flutter_demo/logic/blocs/auth/login/login_state.dart';

///Login Bloc
///Created By - Manendra Ranathunga
///Created Date - 26.12.2021
///Updated By - Manendra Ranathunga
///Updated Date - 30.12.2021
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    ///Maps the given login related events to it's respective states
    ///email update
    on<LoginEmailChanged>(
        (event, emit) => emit(state.copyWith(email: event.email)));

    ///password update
    on<LoginPasswordChanged>(
        (event, emit) => emit(state.copyWith(password: event.password)));

    ///login form submitted
    on<LoginSubmitted>(_onLoginSubmit);

    ///signout clickec
    on<SignoutClick>(_onSignoutClick);
  }

  ///Handles the login form submitted events
  ///Created By - Manendra Ranathunga
  ///Created Date - 27.12.2021
  ///Updated By - Manendra Ranathunga
  ///Updated Date - 30.12.2021
  Future<void> _onLoginSubmit(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(newFomState: FormSubmitting()));

    try {
      AppUser user = await AuthRepository().login(event.email, event.password);
      if (user.email == null) {
        emit(state.copyWith(
            newFomState: SubmissionFailed(
                error: "Email not registered. Please register")));
      } else if (user.emailVerified != null && user.emailVerified == true) {
        emit(state.copyWith(
            name: user.name,
            email: user.email,
            signedIn: true,
            newFomState: SubmissionSucces()));
      } else {
        emit(state.copyWith(
            newFomState: SubmissionFailed(
                error:
                    "Email not verified. Please check your emails to verify email.")));
      }
    } on Exception catch (e) {
      emit(state.copyWith(newFomState: SubmissionFailed(error: e.toString())));
    }
  }

  ///Handles the signout button click events
  ///Created By - Manendra Ranathunga
  ///Created Date - 30.12.2021
  Future<void> _onSignoutClick(
      SignoutClick event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        name: "",
        email: "",
        password: "",
        signedIn: false,
        newFomState: const InitialFormState()));

    ///Signout from the firebase auth
    FirebaseAuth.instance.signOut();
  }
}
