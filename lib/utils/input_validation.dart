import 'package:firebase_auth_flutter_app/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:firebase_auth_flutter_app/models/credentials_model.dart';
import 'package:firebase_auth_flutter_app/ui/actions/app_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputValidation with AppActions {
  static bool simpleEmailValidation(String eMail) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(eMail);
  }

  static String eMailValidation(String eMail) {
    if (!simpleEmailValidation(eMail)) {
      return 'Please fill eMAil field correctly';
    }
    return null;
  }

  static bool passwordLengthValidation(String password) {
    return password.length >= 8;
  }

  static String passwordValidation(String password) {
    if (!passwordLengthValidation(password)) {
      return 'Password length must be at least 8 characters';
    }
    return null;
  }

  static bool nameLengthValidation(String name) {
    return name.length >= 3;
  }

  static String nameValidation(String name) {
    if (!nameLengthValidation(name)) {
      return 'Name length must be at least 3 characters';
    }
    return null;
  }

  void validateRegistrationAndSubmit(BuildContext context,
      CredentialsModel credentials, String passwordConfirmation) {
    if (!InputValidation.nameLengthValidation(credentials.name ?? '')) {
      showSnackBar(context, 'Please fill name field correctly');
      return;
    }

    if (!InputValidation.simpleEmailValidation(credentials.eMail ?? '')) {
      showSnackBar(context, 'Please fill eMail field correctly');
      return;
    }

    if (!InputValidation.passwordLengthValidation(credentials.password ?? '') &&
        !InputValidation.passwordLengthValidation(passwordConfirmation ?? '')) {
      showSnackBar(context, 'Please fill password fields correctly');
      return;
    }

    if (credentials.password != passwordConfirmation) {
      showSnackBar(context, 'Passwords are not the same');
      return;
    }

    BlocProvider.of<AuthenticationBloc>(context).add(SignUp(credentials));
  }

  void validateLoginAndSubmit(
      BuildContext context, CredentialsModel credentials) {
    if (!InputValidation.simpleEmailValidation(credentials.eMail ?? '')) {
      showSnackBar(context, 'Please fill eMail field correctly');
      return;
    }

    if (!InputValidation.passwordLengthValidation(credentials.password ?? '')) {
      showSnackBar(context, 'Please fill password field correctly');
      return;
    }

    BlocProvider.of<AuthenticationBloc>(context).add(SignIn(credentials));
  }

  void validateForgotPasswordAndSubmit(
      BuildContext context, CredentialsModel credentials) {
    if (InputValidation.simpleEmailValidation(credentials.eMail)) {
      BlocProvider.of<AuthenticationBloc>(context)
          .add(RestorePassword(credentials));
    } else {
      showSnackBar(context, 'Please fill eMail field correctly');
    }
  }
}
