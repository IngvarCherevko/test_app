import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_flutter_app/models/credentials_model.dart';
import 'package:firebase_auth_flutter_app/models/user_model.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

abstract class IAuthenticationService {
  Future<UserModel> signIn(CredentialsModel credentials);

  Future<UserModel> signUp(CredentialsModel credentials);

  Future<bool> restorePassword(CredentialsModel credentials);
}

class AuthenticationService extends IAuthenticationService {
   UserModel _userModel;

  @override
  Future<UserModel> signIn(CredentialsModel credentials) async {
    assert(credentials.eMail != null && credentials.password != null);

    try {
      _userModel = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: credentials.eMail, password: credentials.password)
          .then(
            (value) => UserModel(
                id: value.user.uid,
                email: value.user.email,
                name: value.user.displayName),
          );
      return _userModel;
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (error) {
      throw Exception("Error");
    }
  }

  @override
  Future<UserModel> signUp(CredentialsModel credentials) async {
    assert(credentials.eMail != null && credentials.password != null);
    try {
      _userModel = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: credentials.eMail, password: credentials.password)
          .then((value) => UserModel(
            id: value.user.uid,
            email: value.user.email,
            name: value.user.displayName));
      return _userModel;
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
      var actionCodeSetting = ActionCodeSettings(
          url: 'https://auth-flutter-test-app.firebaseapp.com?email=${credentials.eMail}',
      dynamicLinkDomain: 'firebaseauthflutterapp.page.link',
      androidInstallApp: true,
      androidMinimumVersion: '21',
      androidPackageName: 'com.example.firebase_auth_flutter_app',
      handleCodeInApp: true,
      iOSBundleId: 'com.example.firebaseAuthFlutterApp');
      await FirebaseAuth.instance.sendPasswordResetEmail(email: credentials.eMail, actionCodeSettings: actionCodeSetting);
      return Future(() => true);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      rethrow;
    } catch (e) {
      throw Exception("Error");
    }
  }
}
