import 'package:firebase_auth_flutter_app/theme/colors.dart';
import 'package:firebase_auth_flutter_app/theme/text_style.dart';
import 'package:firebase_auth_flutter_app/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';
class SearchInput extends StatelessWidget {
  final bool activated;
  final Function() onCancel;
  final Function(String searchStr) onSearch;
  final FocusNode focusNode;

  const SearchInput(
      {Key key, this.activated, this.onCancel, this.onSearch, this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final wMultiplier = ScreenDimensions.getInstance().getWidthMultiplier();
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(14 * hMultiplier)),
      borderSide: BorderSide(color: accentWhite, width: 1.0),
    );
    return Container(
      alignment: Alignment.centerLeft,
      height: 48 * hMultiplier,
      width: 310 * wMultiplier,
      child: TextField(

          style: darkGray16Montserrat700,
          onChanged: (text) {},
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            filled: true,
            fillColor: accentWhite,
            prefixIcon: Container(
                margin: EdgeInsets.all(6.5 * hMultiplier),
                child: Image.asset(
                  'assets/icons/search.png',
                )),
            hintText: 'Search for a service',
            hintStyle: accentGray16Montserrat700,
            focusedBorder: border,
            enabledBorder: border,
            border: border,
          )),
    );
  }
}
