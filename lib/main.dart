import 'package:firebase_auth_flutter_app/theme/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/authentication_bloc/authentication_bloc.dart';
import 'bloc/authentication_check_bloc/authentication_check_bloc.dart';
import 'ui/navigation/routes.dart';
import 'ui/navigation/screens.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FirebaseDynamicLinks.instance.onLink(
    //     onSuccess: (linkData) {
    //       if (linkData != null) {
    //         try {
    //           Navigator.pushNamed(context, 'PreviewScreen', arguments: linkData);
    //         } catch(e) {
    //           print(e);
    //         }
    //       }
    //       return null;
    //     }
    // );

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthenticationCheckBloc()),
          BlocProvider(create: (context) => AuthenticationBloc()),
        ],
        child: Builder(
          builder: (context) {
            return BlocBuilder<AuthenticationCheckBloc,
                AuthenticationCheckState>(
              builder: (context, state) {
                BlocProvider.of<AuthenticationCheckBloc>(context)
                    .add(CheckAuthStatus());
                if (state is AuthenticationCheckInitial) {
                  return Container(
                      color: accentWhite,
                      child: Center(child: CircularProgressIndicator()));
                }
                return MaterialApp(
                  initialRoute:
                      (state is Registered) ? Screens.home : Screens.welcome,
                  routes: appRoutes,
                );
              },
            );
          },
        ));
  }
}
