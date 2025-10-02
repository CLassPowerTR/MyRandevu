import 'package:flutter/material.dart';
import 'package:my_randevu/core/constants/app_colors.dart';
import 'package:my_randevu/core/constants/app_paddings.dart';
import 'package:my_randevu/core/constants/app_radius.dart';
import 'package:my_randevu/core/constants/app_strings.dart';
import 'package:my_randevu/core/constants/app_text_styles.dart';

TextFormField textFormFieldAppointment({
  required BuildContext context,
  TextEditingController? controller,
  String? initialValue,
  String? hintText,
  ValueChanged<String>? onChanged,
  FormFieldValidator<String>? validator,
  bool obscureText = false,
  int maxLines = 1,
}) {
  return TextFormField(
    controller: controller,
    initialValue: initialValue,
    onChanged: onChanged,
    validator: validator,
    obscureText: obscureText,
    maxLines: maxLines,
    decoration: InputDecoration(
      disabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.r24,
        borderSide: BorderSide(color: AppColors.outline(context)),
      ),
      border: OutlineInputBorder(
        borderRadius: AppRadius.r24,
        borderSide: BorderSide(color: AppColors.outline(context)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.r24,
        borderSide: BorderSide(color: AppColors.outline(context)),
      ),
      hintText: hintText ?? AppStrings.takeAppointmentDescription,
      hintStyle: AppTextStyle.bodyMediumMuted(context),
      contentPadding: AppPaddings.h10,
    ),
  );
}
