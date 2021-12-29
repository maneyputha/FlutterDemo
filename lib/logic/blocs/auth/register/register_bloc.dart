import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/data/repositories/auth_repository.dart';
import 'package:flutter_demo/logic/blocs/Forms/form_submission_state.dart';
import 'package:flutter_demo/logic/blocs/auth/register/register_event.dart';
import 'package:flutter_demo/logic/blocs/auth/register/register_state.dart';

///Login Bloc
///Created By - Manendra Ranathunga
///Created Date - 26.12.2021
///Updated By - Manendra Ranathunga
///Updated Date - 28.12.2021
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    ///Maps the given login related events to it's respective states
    ///email update
    on<RegisterEmailChanged>(
        (event, emit) => emit(state.copyWith(email: event.email)));

    ///password update
    on<RegisterPasswordChanged>(
        (event, emit) => emit(state.copyWith(password: event.password)));

    ///login form submitted
    on<RegisterSubmitted>(_onRegisterubmit);
  }

  ///Handles the login form submitted events
  ///Created By - Manendra Ranathunga
  ///Created Date - 27.12.2021
  Future<void> _onRegisterubmit(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(newFomState: FormSubmitting()));

    try {
      await AuthRepository().register(event.email, event.password);
      emit(state.copyWith(newFomState: SubmissionSucces()));
    } on Exception catch (e) {
      emit(state.copyWith(newFomState: SubmissionFailed(error: e.toString())));
    }
  }
}
