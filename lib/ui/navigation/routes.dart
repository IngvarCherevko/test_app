import 'package:firebase_auth_flutter_app/ui/navigation/screens.dart';
import 'package:firebase_auth_flutter_app/ui/screens/forgot_password_screen/forgot_password.dart';
import 'package:firebase_auth_flutter_app/ui/screens/home_screen/home_screen.dart';
import 'package:firebase_auth_flutter_app/ui/screens/login_screen/login_screen.dart';
import 'package:firebase_auth_flutter_app/ui/screens/register_screen/register_screen.dart';
import 'package:firebase_auth_flutter_app/ui/screens/success_screen/success_screen.dart';
import 'package:firebase_auth_flutter_app/ui/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(dynamic)> appRoutes = {
  Screens.home: (ctx) => HomeScreen(),
  Screens.welcome: (ctx) => WelcomeScreen(),
  Screens.successScreen: (ctx) => SuccessScreen(),
  Screens.login: (ctx) => LoginScreen(),
  Screens.registration: (cts) => RegisterScreen(),
  Screens.forgotPassword: (ctx) => ForgotPasswordScreen(),
 // Screens.resetScreen: (ctx) => SuccessScreen(),
};