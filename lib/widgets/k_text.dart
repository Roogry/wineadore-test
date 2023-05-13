import 'package:flutter/material.dart';
import 'package:wineadore/configs/app_theme.dart';

class KText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool isOverflow;

  const KText({
    Key? key,
    this.text,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.isOverflow = false,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text?? "",
      style: TextStyle(
        fontSize: fontSize?? 14,
        fontFamily: fontFamily,
        fontWeight: fontWeight?? FontWeight.normal,
        color: color?? AppTheme.blackText,
        overflow: isOverflow? TextOverflow.ellipsis : null,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}