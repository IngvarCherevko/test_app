import 'package:firebase_auth_flutter_app/theme/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/authentication_bloc/authentication_bloc.dart';
import 'bloc/authentication_check_bloc/authentication_check_bloc.dart';
import 'bloc/deep_link/deep_link_bloc.dart';
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
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationCheckBloc()),
        BlocProvider(create: (context) => AuthenticationBloc()),
        BlocProvider(create: (context) => DeepLinkBloc()),
      ],
      child: Builder(
        builder: (context) {
          return BlocBuilder<DeepLinkBloc, DeepLinkState>(
            builder: (context, state) {
              BlocProvider.of<DeepLinkBloc>(context).add(CheckDeepLinkStatus());
              if (state is DeepLinkInitial) {
                return Container(
                    color: accentWhite,
                    child: Center(child: CircularProgressIndicator()));
              }
              if (state is OpenInDeepLinkState) {
                return MaterialApp(
                  home: Scaffold(
                    body: Center(
                      child: Text('Open with deepLink'),
                    ),
                  ),
                );
              }
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
          );
        },
      ),
    );
  }
}
