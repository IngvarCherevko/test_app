import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth_flutter_app/models/service_model.dart';
import 'package:firebase_auth_flutter_app/theme/text_style.dart';
import 'package:firebase_auth_flutter_app/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';

class ServiceInfo extends StatelessWidget {
  const ServiceInfo({Key key, this.model, this.margin}) : super(key: key);

  final ServiceModel model;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final wMultiplier = ScreenDimensions.getInstance().getWidthMultiplier();
    return Container(
      margin: margin,
      child: Row(children: [
        getInfoElement(88 * wMultiplier, 'assets/icons/clock.png', '${model.publicationDate} hr.'),
        getInfoElement(96.17 * wMultiplier, 'assets/icons/price.png', '${model.minPrice}-${model.maxPrice} ${model.currency}'),
        getInfoElement(144 * wMultiplier, 'assets/icons/attention.png', 'Available: ${model.estimateDate} hr')
      ],),
    );
  }

  Widget getInfoElement(double width, String imagePath, String text){
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final wMultiplier = ScreenDimensions.getInstance().getWidthMultiplier();
    return Container(
      width: width,
      child: Row(children: [
        Image.asset(imagePath, height: 21.67 * hMultiplier,),
        SizedBox(width: 7.58 * wMultiplier),
        AutoSizeText(
          text,
          overflow: TextOverflow.ellipsis,
          style: lightBlack14Quicksand400,
          maxFontSize: 14,
          minFontSize: 12,
          maxLines: 1,
        )
      ],),
    );
  }
}
