import 'package:firebase_auth_flutter_app/theme/colors.dart';
import 'package:firebase_auth_flutter_app/theme/text_style.dart';
import 'package:firebase_auth_flutter_app/ui/common_widgets/text_container.dart';
import 'package:firebase_auth_flutter_app/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField(
      {Key key, this.title, this.margin, this.controller, this.onChanged, this.validate})
      : super(key: key);

  final String title;
  final EdgeInsets margin;
  final TextEditingController controller;
  final Function(String) onChanged;
  final String Function(String)validate;

  @override
  Widget build(BuildContext context) {
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10 * hMultiplier)),
        borderSide: BorderSide(color: dirtyBlue, width: 1.0));
    return Container(
      height: 113 * hMultiplier,
      margin: margin,
      child: Column(

        children: [
          TextContainer(
            text: title ?? '',
            height: 18 * hMultiplier,
            margin: EdgeInsets.only(bottom: 13 * hMultiplier),
            style: dirtyWhite14Quicksand500,
            containerAlign: Alignment.topLeft,
            maxFontSize: 14,
            minFontSize: 8,
          ),
          Container(
            height: 63 * hMultiplier,
            child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller,
                style: accentWhite18Quicksand500.copyWith(fontSize: 18 * hMultiplier),
                validator: validate,
                onChanged: onChanged,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10,0,10,0),
                  focusedBorder: border,
                  enabledBorder: border,
                  border: border,
                )),
          )
        ],
      ),
    );
  }
}