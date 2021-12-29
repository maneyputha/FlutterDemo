///Exceptions related enums
///Created By - Manendra Ranathunga
///Created Date - 09.12.2021

///Firebase exception enums
///Created By - Manendra Ranathunga
///Created Date - 19.12.2021
enum FirebaseExceptCodes { weakPassword, emailAlreadyInUse, defaultValue }

extension FirebaseExceptionsExtension on FirebaseExceptCodes {
  String get name {
    switch (this) {
      case FirebaseExceptCodes.weakPassword:
        return 'weak-password';
      case FirebaseExceptCodes.emailAlreadyInUse:
        return 'email-already-in-use';
      case FirebaseExceptCodes.defaultValue:
        return 'default';
      default:
        return "default";
    }
  }
}
