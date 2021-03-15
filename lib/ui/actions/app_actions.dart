import 'package:flutter/material.dart';

mixin AppActions {
  void navigateTo(BuildContext context, String screenName) {
    Navigator.pushNamed(context, screenName);
  }

  void navigateToReplacement(BuildContext context, String screenName) {
    Navigator.pushReplacementNamed(context, screenName);
  }

  void navigateToReplacementAll(BuildContext context, String screenName) {
    Navigator.pushNamedAndRemoveUntil(context, screenName, (Route<dynamic> route) => false);
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1800),
    ));
  }
}
