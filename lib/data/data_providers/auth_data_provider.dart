import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

///Handles the firebase auth requests
///Created By - Manendra Ranathunga
///Created Date - 18.12.2021
///Updated By - Manendra Ranathunga
///Updated Date - 28.12.2021

class AuthAPI {
  ///Creates a singleton instance and enables you to retrieve the singleton via a factory.
  static final AuthAPI _authAPI = AuthAPI._internal();

  ///Auth Repository private constructor
  AuthAPI._internal();

  factory AuthAPI() {
    return _authAPI;
  }

  ///Login API Request
  ///Params :
  ///email - email address of the user
  ///password - password of the user
  ///Returns:
  ///UserCredential - returns UserCredentials from the firebase auth API.
  ///Created By - Manendra Ranathunga
  ///Created Date - 18.12.2021
  ///Updated By - Manendra Ranathunga
  ///Updated Date - 28.12.2021
  Future<UserCredential> login(String email, String password) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  ///Register Request
  ///Params :
  ///email - email address for user registrations
  ///password - password for user registration
  ///Returns:
  ///UserCredential - returns UserCredentials from the firebase auth API.
  ///Created By - Manendra Ranathunga
  ///Created Date - 19.12.2021
  ///Updated By - Manendra Ranathunga
  ///Updated Date - 28.12.2021
  Future<UserCredential> register(String email, String password) async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    // Sends the user verification email. Firebase handles the email forwarding.
    //TODO Research if the email design can be modified from firebase
    user.user.sendEmailVerification();
    return user;
  }
}
