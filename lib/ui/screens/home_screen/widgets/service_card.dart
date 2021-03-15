import 'package:firebase_auth_flutter_app/models/service_model.dart';
import 'package:firebase_auth_flutter_app/theme/colors.dart';
import 'package:firebase_auth_flutter_app/theme/text_style.dart';
import 'package:firebase_auth_flutter_app/ui/common_widgets/text_container.dart';
import 'package:firebase_auth_flutter_app/ui/screens/home_screen/widgets/service_info.dart';
import 'package:firebase_auth_flutter_app/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';

import 'stars.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({Key key, @required this.model, this.onTap})
      : super(key: key);

  final ServiceModel model;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final wMultiplier = ScreenDimensions.getInstance().getWidthMultiplier();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(21 * wMultiplier, 3.5 * hMultiplier,
            21.42 * wMultiplier, 3.5 * hMultiplier),
        height: 156 * hMultiplier,
        padding: EdgeInsets.fromLTRB(
            21.67 * wMultiplier, 21.65 * hMultiplier, 21.67 * wMultiplier, 0),
        decoration: BoxDecoration(
          color: accentWhite,
          borderRadius: BorderRadius.circular(14 * hMultiplier),
          boxShadow: [
            BoxShadow(
                color: transparentBlack,
                offset: Offset(0, 5),
                blurRadius: 20,
                spreadRadius: 3),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 71.5 * hMultiplier,
                  width: 71.5 * hMultiplier,
                  decoration: BoxDecoration(
                      color: accentOrange,
                      borderRadius:
                          BorderRadius.all(Radius.circular(14 * hMultiplier)),
                      image:
                          DecorationImage(image: NetworkImage(model.imageUrl))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextContainer(
                      width: 239.42 * wMultiplier,
                      text: model.title,
                      style: accentBlack18Quicksand700,
                      maxFontSize: 18,
                      minFontSize: 14,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      containerAlign: Alignment.topLeft,
                    ),
                    Stars(
                      margin: EdgeInsets.only(top: 12.27 * hMultiplier),
                      stars: model.stars,
                    ),
                  ],
                )
              ],
            ),
            ServiceInfo(
              model: model,
              margin: EdgeInsets.only(top: 19.5 * hMultiplier),
            )
          ],
        ),
      ),
    );
  }
}
