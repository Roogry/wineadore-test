import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wineadore/configs/app_theme.dart';
import 'package:wineadore/widgets/k_text.dart';

class Helper {
  static List<BoxShadow> getShadow({
    Color? color,
    BlurStyle? blurStyle,
    double? blurRadius,
    double? spreadRadius,
    Offset? offset,
  }) {
    return [
      BoxShadow(
        color: color ?? Colors.black.withOpacity(.1),
        blurRadius: blurRadius ?? 5,
        offset: offset ?? const Offset(1.0, 5.0),
        blurStyle: blurStyle ?? BlurStyle.normal,
        spreadRadius: spreadRadius ?? 1,
      )
    ];
  }

  static BorderRadiusGeometry getRadius(
    double radius, {
    bool? isAll = true,
    double? radiusTopRight = 0.0,
    double? radiusBottomRight = 0.0,
    double? radiusBottomLeft = 0.0,
  }) {
    return isAll == true
        ? BorderRadius.all(Radius.circular(radius))
        : BorderRadius.only(
            topLeft: Radius.circular(radius),
            bottomLeft: Radius.circular(radiusBottomLeft!),
            bottomRight: Radius.circular(radiusBottomRight!),
            topRight: Radius.circular(radiusTopRight!),
          );
  }

  static toast(
    String message, {
    Widget? icon,
    bool showProgressIndicator = false,
    Duration animationDuration = const Duration(milliseconds: 100),
  }) {
    Get.closeAllSnackbars();
    Get.rawSnackbar(
      messageText: KText(
        text: message,
        fontSize: 14,
        color: Colors.white,
        isOverflow: false,
      ),
      icon: icon,
      borderRadius: 8,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 32),
      backgroundColor: AppTheme.blackText,
      showProgressIndicator: showProgressIndicator,
      animationDuration: animationDuration,
    );
  }

  static PreferredSizeWidget customAppBar({
    Color? bgColor,
  }) {
    return AppBar(
      backgroundColor: bgColor ?? AppTheme.primaryColor.withOpacity(.45),
      elevation: 0.0,
      iconTheme: const IconThemeData(color: AppTheme.blackText),
      leading: const Padding(
        padding: EdgeInsets.only(left: 16),
        child: BackButton(),
      ),
      toolbarHeight: 68,
    );
  }

  static snackbarSoon() {
    toast(
      "Fitur ini akan segera hadir",
      icon: const Icon(
        Icons.warning_rounded,
        color: Colors.white,
      ),
    );
  }
}
