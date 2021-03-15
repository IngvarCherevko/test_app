import 'package:firebase_auth_flutter_app/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:firebase_auth_flutter_app/config.dart';
import 'package:firebase_auth_flutter_app/models/credentials_model.dart';
import 'package:firebase_auth_flutter_app/theme/colors.dart';
import 'package:firebase_auth_flutter_app/theme/text_style.dart';
import 'package:firebase_auth_flutter_app/ui/actions/app_actions.dart';
import 'package:firebase_auth_flutter_app/ui/common_widgets/button.dart';
import 'package:firebase_auth_flutter_app/ui/common_widgets/custom_input_field.dart';
import 'package:firebase_auth_flutter_app/ui/common_widgets/rouded_container.dart';
import 'package:firebase_auth_flutter_app/ui/common_widgets/sign_in_header.dart';
import 'package:firebase_auth_flutter_app/ui/common_widgets/text_container.dart';
import 'package:firebase_auth_flutter_app/ui/navigation/screens.dart';
import 'package:firebase_auth_flutter_app/utils/input_validation.dart';
import 'package:firebase_auth_flutter_app/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with AppActions {
  CredentialsModel credentials = CredentialsModel();
  String passwordConfirmation = '';

  @override
  Widget build(BuildContext context) {
    ScreenDimensions.calculateMultipliers(context);
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final wMultiplier = ScreenDimensions.getInstance().getWidthMultiplier();
    final statusBarHeight = ScreenDimensions.getInstance().getStatusBarHeight();

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is SignedIn) navigateToReplacementAll(context, Screens.home);
      },
      child: Scaffold(
        appBar: SignInHeader(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height -
                  statusBarHeight -
                  appBarHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextContainer(
                    margin: EdgeInsets.only(
                        left: 32 * wMultiplier, top: 7 * hMultiplier),
                    text: 'Create a new account',
                    style: darkBlue26Quicksand700,
                    height: 33 * hMultiplier,
                    textAlign: TextAlign.left,
                    containerAlign: Alignment.centerLeft,
                    maxFontSize: 26,
                    minFontSize: 18,
                  ),
                  TextContainer(
                    margin: EdgeInsets.only(
                        top: 4 * hMultiplier, bottom: 41 * hMultiplier),
                    text: 'Please provide us with your details to register',
                    style: accentGray14Quicksand500,
                    height: 36 * hMultiplier,
                    width: 313 * wMultiplier,
                    textAlign: TextAlign.left,
                    containerAlign: Alignment.centerLeft,
                    maxFontSize: 14,
                    minFontSize: 8,
                    maxLines: 2,
                  ),
                  RoundedContainer(
                    height: 691 * hMultiplier,
                    children: [
                      CustomInputField(
                        validate: InputValidation.nameValidation,
                        onChanged: (text) => credentials.name = text,
                        title: 'Your name',
                      ),
                      CustomInputField(
                        validate: InputValidation.eMailValidation,
                        onChanged: (text) => credentials.eMail = text,
                        title: 'E-mail address',
                      ),
                      CustomInputField(
                        validate: InputValidation.passwordValidation,
                        onChanged: (text) => credentials.password = text,
                        title: 'Password',
                      ),
                      CustomInputField(
                        validate: InputValidation.passwordValidation,
                        onChanged: (text) => passwordConfirmation = text,
                        margin: EdgeInsets.only(bottom: 40 * hMultiplier),
                        title: 'ConfirmPassword',
                      ),
                      Button(
                        onTap: () => InputValidation()
                            .validateRegistrationAndSubmit(
                                context, credentials, passwordConfirmation),
                        color: accentBlue,
                        buttonLabel: 'Register',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
