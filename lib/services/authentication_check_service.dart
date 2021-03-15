import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_flutter_app/models/user_model.dart';

abstract class IAuthenticationCheckService {
  Future<UserModel> checkAuthStatus();
}

class AuthenticationCheckService extends IAuthenticationCheckService {
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  Future<UserModel> checkAuthStatus() async {
    if (currentUser != null) {
      print(FirebaseAuth.instance.currentUser.uid.toString());
      return UserModel(
          id: currentUser.uid,
          email: currentUser.email,
          name: currentUser.displayName);
    }
    return null;
  }
}
