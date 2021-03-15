import 'package:firebase_auth_flutter_app/theme/text_style.dart';
import 'package:firebase_auth_flutter_app/ui/common_widgets/text_container.dart';
import 'package:firebase_auth_flutter_app/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenDimensions.calculateMultipliers(context);
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final wMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final statusBarHeight = ScreenDimensions.getInstance().getStatusBarHeight();
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                TextContainer(
                  text: 'Success!',
                  margin:EdgeInsets.only(top: (184 - statusBarHeight) * hMultiplier, bottom: 14 * hMultiplier),
                  height: 53 * hMultiplier,
                  style: darkBlue42Quicksand700,
                  maxFontSize: 42,
                  minFontSize: 24,
                ),
                TextContainer(
                    text: 'We have sent a link to change the password to the e-mail address provided.',
                  margin: EdgeInsets.only(bottom: 91 * hMultiplier),
                  height: 80 * hMultiplier,
                  width: 280 * wMultiplier,
                  style: accentGray16Quicksand700,
                  maxFontSize: 14,
                  minFontSize: 8,
                  maxLines: 3,
                ),
                Image.asset('assets/images/welcome.png', height: 257 * hMultiplier,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
