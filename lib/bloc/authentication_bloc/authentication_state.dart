part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class ForgotPassword extends AuthenticationState{
}

class PasswordResetConfirmed extends AuthenticationState{}

class SignedIn extends AuthenticationState{
  SignedIn(this.user);
  final UserModel user;

  @override
  List<Object> get props => [user];
}

