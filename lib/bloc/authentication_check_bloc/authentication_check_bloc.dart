
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_flutter_app/models/user_model.dart';
import 'package:firebase_auth_flutter_app/services/authentication_check_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_check_event.dart';

part 'authentication_check_state.dart';

class AuthenticationCheckBloc extends Bloc<AuthenticationCheckEvent, AuthenticationCheckState> {
  AuthenticationCheckBloc() : super(AuthenticationCheckInitial());

  IAuthenticationCheckService service = AuthenticationCheckService();
  UserModel _user;

  @override
  Stream<AuthenticationCheckState> mapEventToState(AuthenticationCheckEvent event) async* {
    if (event is CheckAuthStatus){
      // FirebaseAuth.instance.authStateChanges().listen((_user) {
      //   if (_user == null) {
      //     Registered(_user);
      //   }
      // });
      _user = await service.checkAuthStatus();
      if (_user != null) {
        yield Registered(_user);
      } else {
        yield AuthRequired();
      }
    }
  }
}
