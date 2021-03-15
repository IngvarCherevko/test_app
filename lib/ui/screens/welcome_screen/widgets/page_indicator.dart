import 'package:firebase_auth_flutter_app/utils/screen_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({Key key, this.margin}) : super(key: key);

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final wMultiplier = ScreenDimensions.getInstance().getWidthMultiplier();
    final Image ellipse =
        Image.asset('assets/images/ellipse.png', height: 12 * hMultiplier);
    return Container(
      margin: margin,
      height: 12 * hMultiplier,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/rectangle.png', height: 12 * hMultiplier),
          SizedBox(width: 13 * wMultiplier),
          ellipse,
          SizedBox(width: 13 * wMultiplier),
          ellipse,
        ],
      ),
    );
  }
}
