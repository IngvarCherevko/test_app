import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_flutter_app/ui/navigation/screens.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinkService {

  Future<String> initDynamicLinks() async {

    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance
        .getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      // if (deepLink.queryParameters['mode'] == 'resetPassword') {
      //   return deepLink.queryParameters['oobCode'];
      // }
      deepLink.queryParameters.forEach((key, value) {
        print(key + ' : ' + value);
      });
      if ( deepLink.queryParameters != null) {
        print(FirebaseAuth.instance.checkActionCode(deepLink.queryParameters['oobCode']).toString());
        return deepLink.queryParameters['oobCode'];
      }
      // //print(deepLink.queryParameters['resetPassword']);
       print('path: ' + deepLink.path);
      return deepLink.path;
    }
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link;
          if (deepLink != null) {
            deepLink.queryParameters.forEach((key, value) {
              print(key + ' : ' + value);
            });
            print('path: ' + deepLink.path);
            if ( deepLink.queryParameters != null) {
              print(FirebaseAuth.instance.checkActionCode(deepLink.queryParameters['oobCode']).toString());
              return deepLink.queryParameters['oobCode'];
            }
            // print(deepLink.queryParameters['resetPassword']);
            // print(deepLink.queryParameters['oobCode']);
            return deepLink.path;
          }
        },
        onError: (OnLinkErrorException e) async {
          print('onLinkError');
          print(e.message);
        }
    );

  }
}