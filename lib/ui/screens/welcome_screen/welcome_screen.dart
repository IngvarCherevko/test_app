import 'package:firebase_auth_flutter_app/theme/colors.dart';
import 'package:firebase_auth_flutter_app/theme/text_style.dart';
import 'package:firebase_auth_flutter_app/ui/actions/app_actions.dart';
import 'package:firebase_auth_flutter_app/ui/common_widgets/button.dart';
import 'package:firebase_auth_flutter_app/ui/common_widgets/text_container.dart';
import 'package:firebase_auth_flutter_app/ui/navigation/screens.dart';
import 'package:firebase_auth_flutter_app/ui/screens/welcome_screen/widgets/page_indicator.dart';
import 'package:firebase_auth_flutter_app/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget with AppActions{
  @override
  Widget build(BuildContext context) {
    ScreenDimensions.calculateMultipliers(context);
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final wMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final statusBarHeight = ScreenDimensions.getInstance().getStatusBarHeight();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: (187 - statusBarHeight) * hMultiplier),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/frame_background.png',
                  height: 191.03 * hMultiplier,
                ),
                Image.asset(
                  'assets/images/frame.png',
                  height: 230 * hMultiplier,
                )
              ],
            ),
            TextContainer(
              margin: EdgeInsets.only(top: 76 * hMultiplier, bottom: 9 * hMultiplier),
              height: 30 * hMultiplier,
              text: "Let's start!",
              style: darkGray24Quicksand700,
              maxFontSize: 24,
              minFontSize: 16,
            ),
            TextContainer(
              height: 40 * hMultiplier,
              width: 249 * wMultiplier,
              text: 'We will help you access any services you need',
              style: accentGray16Quicksand700,
              maxLines: 2,
              maxFontSize: 16,
              minFontSize: 10,
            ),
            Status(
              margin: EdgeInsets.only(
                  top: 51 * hMultiplier, bottom: 81 * hMultiplier),
            ),
            Button(
              onTap: () => navigateTo(context, Screens.registration),
              color: darkBlue,
              buttonLabel: 'Register',
            ),
            GestureDetector(
              onTap: () => navigateToReplacement(context, Screens.login),
              child: TextContainer(
                text: 'Login to your account',
                height: 26 * hMultiplier,
                margin: EdgeInsets.only(top: 22 * hMultiplier),
                style: accentOrange21Quicksand700,
                maxFontSize: 21,
                minFontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
