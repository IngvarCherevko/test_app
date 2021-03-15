import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  const TextContainer(
      {Key key,
        this.height,
        this.width,
        @required this.text,
        this.style,
        this.minFontSize,
        this.maxFontSize,
        this.maxLines,
        this.margin,
        this.textAlign,
        this.containerAlign})
      : super(key: key);


  final double height;
  final double width;
  final EdgeInsets margin;
  final String text;
  final TextStyle style;
  final double minFontSize;
  final double maxFontSize;
  final int maxLines;
  final TextAlign textAlign;
  final Alignment containerAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: containerAlign,
      height: height,
      width: width,
      margin: margin,
      child: AutoSizeText(
        text,
        overflow: TextOverflow.ellipsis,
        textAlign:textAlign ?? TextAlign.center,
        style: style,
        maxLines: maxLines,
        maxFontSize: maxFontSize,
        minFontSize: minFontSize,
      ),
    );
  }
}
