import 'package:firebase_auth_flutter_app/ui/navigation/screens.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

// class DynamicLinkService {
//
//   Future handleDynamicLinks(BuildContext context) async {
//     final PendingDynamicLinkData data =
//     await FirebaseDynamicLinks.instance.;
//     print('deep link add ' + data.toString() );
//     _handleDeepLink(data, context);
//     // FirebaseDynamicLinks.instance.onLink(
//     //     onSuccess: (PendingDynamicLinkData dynamicLink) async {
//     //       _handleDeepLink(dynamicLink, context);
//     //     }, onError: (OnLinkErrorException e) async {
//     //   print('Link Failed: ${e.message}');
//     // });
//   }
//
//   void _handleDeepLink(PendingDynamicLinkData data, BuildContext context) {
//     final Uri deepLink = data?.link;
//     if (deepLink != null) {
//       print('_handleDeepLink | deeplink: $deepLink');
//
//      var auth = deepLink.pathSegments.contains('__/auth/action?');
//       if (auth) {
//         Navigator.pushReplacementNamed(context, Screens.successScreen);
//       }
//      // var isInvite = deepLink.pathSegments.contains('invite');
//       // if(isInvite){
//       //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
//       //       NavigationHomeScreen()), (Route<dynamic> route) => false);
//       // }
//     }
//   }
// }