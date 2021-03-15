import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_flutter_app/models/credentials_model.dart';
import 'package:firebase_auth_flutter_app/models/user_model.dart';

abstract class IAuthenticationService {
  Future<UserModel> signIn(CredentialsModel credentials);

  Future<UserModel> signUp(CredentialsModel credentials);

  Future<bool> restorePassword(CredentialsModel credentials);
}

class AuthenticationService extends IAuthenticationService {
  // UserModel _userModel;

  @override
  Future<UserModel> signIn(CredentialsModel credentials) async {
    assert(credentials.eMail != null && credentials.password != null);
    // TODO: implement signIn
    // if (credentials.eMail == 'test@gmail.com' &&
    //     credentials.password == 'password') {
    //   return Future(() => UserModel());
    // }
    try {
      UserModel userModel = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: credentials.eMail, password: credentials.password)
          .then(
            (value) => UserModel(
                id: value.user.uid,
                email: value.user.email,
                name: value.user.displayName),
          );
      return userModel;
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (error) {
      throw Exception("Error");
    }
    // TODO: add push errorDialog here
    return null;
  }

  @override
  Future<UserModel> signUp(CredentialsModel credentials) async {
    assert(credentials.eMail != null && credentials.password != null);
    try {
      UserModel userModel = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: credentials.eMail, password: credentials.password)
          .then((value) => UserModel(
            id: value.user.uid,
            email: value.user.email,
            name: value.user.displayName));
      return userModel;
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (error) {
      throw Exception("Error");
    }
    return null;
  }

  @override
  Future<bool> restorePassword(CredentialsModel credentials) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: credentials.eMail);
      return Future(() => true);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      rethrow;
    } catch (e) {
      throw Exception("Error");
    }
  }
}
