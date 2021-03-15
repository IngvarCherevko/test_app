import 'package:firebase_auth_flutter_app/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';

import '../../config.dart';

class SignInHeader extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    return AppBar(
      elevation: 0,
      leading: IconButton (
        icon:Icon(Icons.arrow_back_ios, size: 19.93 * hMultiplier,),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black, size: 1.0),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

}