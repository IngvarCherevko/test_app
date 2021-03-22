import 'package:firebase_auth_flutter_app/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:firebase_auth_flutter_app/models/credentials_model.dart';
import 'package:firebase_auth_flutter_app/theme/colors.dart';
import 'package:firebase_auth_flutter_app/theme/text_style.dart';
import 'package:firebase_auth_flutter_app/ui/actions/app_actions.dart';
import 'package:firebase_auth_flutter_app/ui/common_widgets/button.dart';
import 'package:firebase_auth_flutter_app/ui/common_widgets/custom_input_field.dart';
import 'package:firebase_auth_flutter_app/ui/common_widgets/rouded_container.dart';
import 'package:firebase_auth_flutter_app/ui/common_widgets/text_container.dart';
import 'package:firebase_auth_flutter_app/ui/navigation/screens.dart';
import 'package:firebase_auth_flutter_app/utils/input_validation.dart';
import 'package:firebase_auth_flutter_app/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget with AppActions{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with AppActions {
  CredentialsModel credentials = CredentialsModel();

  @override
  Widget build(BuildContext context) {
    ScreenDimensions.calculateMultipliers(context);
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final statusBarHeight = ScreenDimensions.getInstance().getStatusBarHeight();
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is ForgotPassword)
          navigateTo(context, Screens.forgotPassword);
        if (state is SignedIn) navigateToReplacementAll(context, Screens.home);
        if (state is FirebaseAuthExceptionState) showSnackBar(context, state.props[0].toString());
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - statusBarHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: (80 - statusBarHeight) * hMultiplier),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 48 * hMultiplier,
                  ),
                  TextContainer(
                    margin: EdgeInsets.only(top: 23 * hMultiplier),
                    text: 'Service at your fingertips',
                    style: darkBlue22Quicksand700,
                    height: 28 * hMultiplier,
                    maxFontSize: 28,
                    minFontSize: 20,
                  ),
                  TextContainer(
                    text: 'Get the job done easily!',
                    style: darkBlue22Quicksand700,
                    margin: EdgeInsets.only(bottom: 56 * hMultiplier),
                    height: 28 * hMultiplier,
                    maxFontSize: 28,
                    minFontSize: 20,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/login_image.png',
                        height: 107 * hMultiplier,
                      ),
                      RoundedContainer(
                        height: 515 * hMultiplier,
                        children: [
                          CustomInputField(
                            validate: InputValidation.eMailValidation,
                            onChanged: (text) => credentials.eMail = text,
                            title: 'E-mail address',
                          ),
                          CustomInputField(
                            validate: InputValidation.passwordValidation,
                            onChanged: (text) => credentials.password = text,
                            title: 'Password',
                            margin: EdgeInsets.only(bottom: 35 * hMultiplier),
                          ),
                          Button(
                            onTap: () => InputValidation()
                                .validateLoginAndSubmit(context, credentials),
                            color: accentOrange,
                            buttonLabel: 'Login',
                          ),
                          GestureDetector(
                            onTap: () =>
                                navigateTo(context, Screens.forgotPassword),
                            child: TextContainer(
                              text: 'Have you forgotten your password?',
                              style: accentGray14Quicksand500,
                              margin: EdgeInsets.only(
                                  top: 7 * hMultiplier,
                                  bottom: 53 * hMultiplier),
                              height: 18 * hMultiplier,
                              maxFontSize: 14,
                              minFontSize: 8,
                            ),
                          ),
                          Button(
                            onTap: () =>
                                navigateTo(context, Screens.registration),
                            color: accentBlue,
                            buttonLabel: 'Register',
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
