import 'package:flutter/material.dart';
import 'package:my_randevu/core/constants/app_colors.dart';
import 'package:my_randevu/core/constants/app_paddings.dart';
import 'package:my_randevu/core/constants/app_radius.dart';
import 'package:my_randevu/core/constants/app_text_styles.dart';
import 'package:my_randevu/core/theme/app_theme.dart';

TextButton textButtonStarted(
  BuildContext context,
  String text,
  VoidCallback onPressed, {
  Color? textColor,
  Color? backgroundColor,
  double? fontSize,
  EdgeInsetsGeometry? padding,
  BorderRadiusGeometry? borderRadius,
}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.succesful(context),
      padding: padding ?? AppPaddings.h32v10,

      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? AppRadius.r24,
      ),
    ),
    child: Text(
      text,
      style: AppTextStyle.bodyLargeBold(
        context,
        color: textColor ?? AppColors.surface(context),
      ),
    ),
  );
}
