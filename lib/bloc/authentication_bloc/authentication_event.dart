part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SignIn extends AuthenticationEvent {
  SignIn(this.credentials);

  final CredentialsModel credentials;

  @override
  List<Object> get props => [credentials];
}

class SignUp extends AuthenticationEvent {
  SignUp(this.credentials);

  final CredentialsModel credentials;

  @override
  List<Object> get props => [credentials];
}

class RestorePassword extends AuthenticationEvent {
  RestorePassword(this.credentials);

  final CredentialsModel credentials;

  @override
  List<Object> get props => [credentials];
}