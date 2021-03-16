import 'package:firebase_auth_flutter_app/ui/navigation/screens.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinkService {

  Future<String> initDynamicLinks() async {

    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance
        .getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      return deepLink.path;
    }
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link;
          if (deepLink != null) {
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