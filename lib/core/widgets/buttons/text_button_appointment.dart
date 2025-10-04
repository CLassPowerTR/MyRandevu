import 'package:flutter/material.dart';
import 'package:my_randevu/core/constants/app_colors.dart';
import 'package:my_randevu/core/constants/app_paddings.dart';
import 'package:my_randevu/core/constants/app_radius.dart';
import 'package:my_randevu/core/constants/app_text_styles.dart';
import 'package:my_randevu/core/theme/app_theme.dart';

SizedBox textButtonAppointment(
  BuildContext context,
  String text,
  VoidCallback onPressed, {
  Color? textColor,
  Color? backgroundColor,
  Color? shadowColor,
  double? elevation,
  double? fontSize,
  double? width,
  TextStyle? textStyle,
  EdgeInsetsGeometry? padding,
  BorderRadiusGeometry? borderRadius,
}) {
  return SizedBox(
    width: width ?? double.infinity,
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.textColor(context),
        padding: padding ?? AppPaddings.h10v10,
        elevation: elevation ?? 0,
        shadowColor:
            shadowColor ?? backgroundColor ?? AppColors.textColor(context),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? AppRadius.r8,
        ),
      ),
      child: Text(
        text,
        style:
            textStyle ??
            AppTextStyle.bodyLargeBold(
              context,
              color: textColor ?? AppColors.surface(context),
            ),
      ),
    ),
  );
}
