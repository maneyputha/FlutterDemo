import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/commons/enums/errors.dart';

///User request model
///Created By - Manendra Ranathunga
///Created Date - 18.12.2021
///Updated By - Manendra Ranathunga
///Updated Date - 28.12.2021
class AppUser {
  String? email;
  String? name;
  bool? emailVerified;
  String? phoneNumber;
  String? photoURL;
  bool error;
  String errorMessage;

  ///default constructor with defalut values for error settings
  ///Created By - Manendra Ranathunga
  ///Created Date - 19.12.2021
  AppUser()
      : error = false,
        errorMessage = FirebaseExceptCodes.defaultValue.name;

  ///New app user constructor with defalut values for error settings
  ///Created By - Manendra Ranathunga
  ///Created Date - 19.12.2021
  ///Updated By - Manendra Ranathunga
  ///Updated Date - 28.12.2021
  AppUser.newUser(
      {this.name,
      this.email,
      this.emailVerified,
      this.phoneNumber,
      this.photoURL})
      : error = false,
        errorMessage = FirebaseExceptCodes.defaultValue.name;

  ///Converts a Firebase User to an AppUser Object
  ///Created By - Manendra Ranathunga
  ///Created Date - 18.12.2021
  ///Updated By - Manendra Ranathunga
  ///Updated Date - 28.12.2021
  factory AppUser.fromFirebaseUser(UserCredential firebaseUser) {
    return AppUser.newUser(
        name: firebaseUser.user.displayName,
        email: firebaseUser.user.email,
        emailVerified: firebaseUser.user.emailVerified,
        phoneNumber: firebaseUser.user.phoneNumber,
        photoURL: firebaseUser.user.photoURL);
  }
}
