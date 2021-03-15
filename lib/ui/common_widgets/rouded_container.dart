import 'package:firebase_auth_flutter_app/theme/colors.dart';
import 'package:firebase_auth_flutter_app/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(
      {Key key, @required this.height, @required this.children})
      : super(key: key);

  final double height;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final wMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    return Container(
      padding: EdgeInsets.fromLTRB(43 * wMultiplier, 39.01 * hMultiplier, 43 * wMultiplier, 0),
      height: height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40 * hMultiplier),
              topRight: Radius.circular(40 * hMultiplier))),
      child: Column(
        children: children,
      ),
    );
  }
}
