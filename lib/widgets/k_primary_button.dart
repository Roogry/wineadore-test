import 'package:flutter/material.dart';
import 'package:wineadore/configs/app_theme.dart';
import 'package:wineadore/utils/helper.dart';
import 'package:wineadore/widgets/k_text.dart';

class KPrimaryButton extends StatelessWidget {
  final Function()? onTap;
  String? text;

  KPrimaryButton({
    Key? key,
    this.onTap,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: Helper.getRadius(20),
        ),
        minimumSize: const Size(double.infinity, 56),
        disabledBackgroundColor: AppTheme.placeholderText,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        elevation: 0,
      ),
      child: KText(
        text: text,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
