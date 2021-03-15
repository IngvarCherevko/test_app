import 'package:firebase_auth_flutter_app/theme/colors.dart';
import 'package:firebase_auth_flutter_app/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  const Stars({Key key, @required this.stars, this.margin}) : super(key: key);

  final int stars;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(children: getStars(stars)),
    );
  }

  List<Widget> getStars(int stars) {
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final wMultiplier = ScreenDimensions.getInstance().getWidthMultiplier();
    List<Widget>result = [];
    for (int i = 1; i < 6; i++) {
      result.add(
          Icon(Icons.star, size: 14.44 * hMultiplier,
            color: stars >= i ? lightOrange : almostWhite,)
      );
      if(i == 5) return result;
      result.add(SizedBox(width: 7.22 * wMultiplier));
    }
    return result;
  }
}
