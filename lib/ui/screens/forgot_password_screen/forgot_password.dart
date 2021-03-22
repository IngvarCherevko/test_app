import 'package:firebase_auth_flutter_app/bloc/authentication_bloc/authentication_bloc.dart';
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

import '../../../config.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with AppActions {
  CredentialsModel credentials = CredentialsModel();

  @override
  Widget build(BuildContext context) {
    ScreenDimensions.calculateMultipliers(context);
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final wMultiplier = ScreenDimensions.getInstance().getWidthMultiplier();
    final statusBarHeight = ScreenDimensions.getInstance().getStatusBarHeight();
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is PasswordResetConfirmed)
          navigateToReplacement(context, Screens.successScreen);
        if (state is FirebaseAuthExceptionState) showSnackBar(context, state.props[0].toString());
      },
      child: Scaffold(
          appBar: SignInHeader(),
          body: Builder(
            builder: (context) => SafeArea(
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
                            top: 80 * hMultiplier - appBarHeight,
                            left: 32 * wMultiplier),
                        text: 'Forgot your password?',
                        style: darkBlue26Quicksand700,
                        height: 33 * hMultiplier,
                        textAlign: TextAlign.left,
                        containerAlign: Alignment.centerLeft,
                        maxFontSize: 26,
                        minFontSize: 18,
                      ),
                      TextContainer(
                        margin: EdgeInsets.only(
                            top: 80 * hMultiplier, left: 32 * wMultiplier),
                        text:
                            'Confirm your email address and we will send it instructions.',
                        style: accentGray14Quicksand500,
                        height: 36 * hMultiplier,
                        width: 313 * wMultiplier,
                        textAlign: TextAlign.left,
                        containerAlign: Alignment.centerLeft,
                        maxFontSize: 14,
                        minFontSize: 8,
                        maxLines: 2,
                      ),
                      Image.asset(
                        'assets/images/forgot_password.png',
                        height: 237 * hMultiplier,
                      ),
                      RoundedContainer(
                        height: 368 * hMultiplier,
                        children: [
                          CustomInputField(
                            title: 'E-mail address',
                            validate: InputValidation.eMailValidation,
                            onChanged: (text) => credentials.eMail = text,
                          ),
                          Button(
                            onTap: () => InputValidation()
                                .validateForgotPasswordAndSubmit(
                                    context, credentials),
                            color: accentBlue,
                            buttonLabel: 'Reset password',
                          ),
                          TextContainer(
                            text: 'Existing user?',
                            style: lightGray21Quicksand500,
                            height: 26 * hMultiplier,
                            margin: EdgeInsets.only(
                                top: 54 * hMultiplier, bottom: 4 * hMultiplier),
                            maxFontSize: 21,
                            minFontSize: 14,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: TextContainer(
                              text: 'Login',
                              style: accentOrange21Quicksand700,
                              height: 26 * hMultiplier,
                              maxFontSize: 21,
                              minFontSize: 14,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
