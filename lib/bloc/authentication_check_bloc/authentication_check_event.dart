part of 'authentication_check_bloc.dart';

abstract class AuthenticationCheckEvent extends Equatable {
  const AuthenticationCheckEvent();

  @override
  List<Object> get props => [];
}

class CheckAuthStatus extends AuthenticationCheckEvent {}