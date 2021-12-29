import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_demo/commons/enums/errors.dart';
import 'package:flutter_demo/data/data_providers/auth_data_provider.dart';
import 'package:flutter_demo/data/models/app_user.dart';

///Handles the firebase authentication based repository functionalities
///Created By - Manendra Ranathunga
///Created Date - 28.12.2021
class AuthRepository {
  ///Creates a singleton instance and enables you to retrieve the singleton via a factory.
  static final AuthRepository _authRepository = AuthRepository._internal();

  ///Auth Repository private constructor
  AuthRepository._internal();
  factory AuthRepository() {
    return _authRepository;
  }

  ///Login repository function
  ///Params :
  ///email - email address of the user
  ///password - password of the user
  ///Returns:
  ///AppUser - returns an AppUser object.
  ///Created By - Manendra Ranathunga
  ///Created Date - 28.12.2021
  Future<AppUser> login(String email, String password) async {
    AppUser loggedInUser = AppUser();
    try {
      var rawUser = await AuthAPI().login(email, password);
      loggedInUser = AppUser.fromFirebaseUser(rawUser);
    } catch (e) {
      ///TODO handle exceptions
      throw Exception(e);
    }
    return loggedInUser;
  }

  ///Register repository function
  ///Params :
  ///email - email address of the user
  ///password - password of the user
  ///Returns:
  ///AppUser - returns an AppUser object.
  ///Created By - Manendra Ranathunga
  ///Created Date - 18.12.2021
  ///Updated By - Manendra Ranathunga
  ///Updated Date - 28.12.2021
  Future<AppUser> register(String email, String password) async {
    AppUser loggedInUser = AppUser();
    try {
      var rawUser = await AuthAPI().register(email, password);
      loggedInUser = AppUser.fromFirebaseUser(rawUser);
    } on FirebaseAuthException catch (e) {
      ///TODO handle exceptions
      if (e.code == FirebaseExceptCodes.weakPassword.name) {
        loggedInUser.error = true;
        loggedInUser.errorMessage = FirebaseExceptCodes.weakPassword.name;
        throw Exception(
            FirebaseExceptCodes.weakPassword.name.replaceAll("-", " "));
      } else if (e.code == FirebaseExceptCodes.emailAlreadyInUse.name) {
        loggedInUser.error = true;
        loggedInUser.errorMessage = FirebaseExceptCodes.emailAlreadyInUse.name;
        throw Exception(
            FirebaseExceptCodes.emailAlreadyInUse.name.replaceAll("-", " "));
      } else {
        throw Exception(e);
      }
    } on Exception catch (e) {
      throw Exception(e);
    }

    return loggedInUser;
  }
}
