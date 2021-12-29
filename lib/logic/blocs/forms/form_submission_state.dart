import 'package:flutter/material.dart';

///Form Submission State
///Handles four different levels of form submission
///Initial / Submitting / Success / Failure
///Created By - Manendra Ranathunga
///Created Date - 26.12.2021

abstract class FormSubmissionState {
  const FormSubmissionState();
}

class InitialFormState extends FormSubmissionState {
  const InitialFormState();
}

class FormSubmitting extends FormSubmissionState {}

class SubmissionSucces extends FormSubmissionState {}

class SubmissionFailed extends FormSubmissionState {
  final String error;

  SubmissionFailed({required this.error});
}
