part of 'authentication_check_bloc.dart';

abstract class AuthenticationCheckState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationCheckInitial extends AuthenticationCheckState {}

class AuthRequired extends AuthenticationCheckState{}

class Registered extends AuthenticationCheckState{
  Registered(this.user);

  final UserModel user;
  @override
  List<Object> get props => [user];
}
