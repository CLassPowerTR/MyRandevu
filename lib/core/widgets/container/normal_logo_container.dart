import 'package:flutter/material.dart';
import 'package:my_randevu/core/api/api_config.dart';
import 'package:my_randevu/core/constants/app_colors.dart';
import 'package:my_randevu/core/constants/app_paddings.dart';
import 'package:my_randevu/core/constants/app_radius.dart';
import 'package:my_randevu/core/enums/assets/app_images.dart';

Container normalLogoContainer({
  required BuildContext context,
  required String imageUrl,
  double? width,
  double? height,
}) {
  return Container(
    padding: AppPaddings.all12,
    decoration: BoxDecoration(
      border: BoxBorder.all(
        color: AppColors.outline(context),
        style: BorderStyle.solid,
      ),
      borderRadius: AppRadius.r8,
      boxShadow: [
        BoxShadow(
          color: AppColors.shadow(context).withOpacity(0.2),
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
      color: AppColors.surface(context),
    ),
    width: width ?? MediaQuery.of(context).size.width * 0.43,
    height: height ?? MediaQuery.of(context).size.height * 0.1,
    child: Image.network(
      imageUrl,
      fit: BoxFit.contain,
      errorBuilder: (c, e, s) => Image.asset(AppImages.myrandevulogo),
    ),
  );
}
