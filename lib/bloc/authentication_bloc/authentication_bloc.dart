import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_flutter_app/models/credentials_model.dart';
import 'package:firebase_auth_flutter_app/models/user_model.dart';
import 'package:firebase_auth_flutter_app/services/authentication_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());
  final currentUser = FirebaseAuth.instance.currentUser;
  IAuthenticationService service = AuthenticationService();
  UserModel _user;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is SignIn) {
      print('SignInEvent');
      try {
        _user = await service.signIn(event.credentials);
        if (_user != null) {
          yield SignedIn(_user);
        } else
          yield ForgotPassword();
      } catch (e) {
        print(e);
      }
    }
    if (event is SignUp) {
      _user = await service.signUp(event.credentials);
      if (_user != null) {
        yield SignedIn(_user);
      }
    }
    if (event is RestorePassword) {
      if (await service.restorePassword(event.credentials)) {
        yield PasswordResetConfirmed();
      }
    }
  }
}
