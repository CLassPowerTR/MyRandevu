import 'package:flutter/material.dart';
import 'package:my_randevu/core/constants/app_colors.dart';
import 'package:my_randevu/core/constants/app_text_styles.dart';

TextButton TurnBackTextIconButton(BuildContext context) {
  return TextButton.icon(
    onPressed: () {
      Navigator.pop(context);
    },
    icon: Icon(Icons.arrow_back, color: AppColors.textColor(context)),
    label: Text('Geri Dön', style: AppTextStyle.bodyMedium(context)),
  );
}
