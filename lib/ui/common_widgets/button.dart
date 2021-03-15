import 'package:firebase_auth_flutter_app/theme/text_style.dart';
import 'package:firebase_auth_flutter_app/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {Key key, @required this.buttonLabel, @required this.onTap, this.color})
      : super(key: key);

  final String buttonLabel;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final wMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    return Container(
        height: 54 * hMultiplier,
        width: 306 * wMultiplier,
        child: RaisedButton(
          color: color,
          onPressed: onTap,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(27 * hMultiplier)),
          child: Text(
            buttonLabel,
            style: accentWhite21Quicksand700,
          ),
        ));
  }
}
