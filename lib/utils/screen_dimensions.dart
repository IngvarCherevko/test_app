import 'package:flutter/cupertino.dart';

class ScreenDimensions {
  static final ScreenDimensions _screenDimensions = ScreenDimensions();

  static const _referencedHeight = 896.0;
  static const _referencedWidth = 414.0;

  double _statusBarHeight;
  double _heightMultiplier;
  double _widthMultiplier;

  static void calculateMultipliers(BuildContext context) {
    _screenDimensions._statusBarHeight = MediaQuery.of(context).padding.top;
    _screenDimensions._heightMultiplier =
        MediaQuery.of(context).size.height / _referencedHeight;
    _screenDimensions._widthMultiplier =
        MediaQuery.of(context).size.width / _referencedWidth;
  }

  static ScreenDimensions getInstance() => _screenDimensions;

  double getHeightMultiplier() => _heightMultiplier;

  double getWidthMultiplier() => _widthMultiplier;

  double getStatusBarHeight() => _statusBarHeight;
}
