

import 'package:flutter/material.dart';
import 'package:my_randevu/core/constants/app_colors.dart';
import 'package:my_randevu/core/constants/app_paddings.dart';
import 'package:my_randevu/core/constants/app_radius.dart';
import 'package:shimmer/shimmer.dart';

Widget dropdownShimmer(BuildContext context) {
  return Shimmer.fromColors(
          baseColor: AppColors.outline(context).withOpacity(0.5),
          highlightColor: AppColors.surface(context),
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.outline(context).withOpacity(0.5),
              borderRadius: AppRadius.r24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 100,
                  margin: AppPaddings.all12,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.cardColor(context),
                    borderRadius: AppRadius.r24,
                  ),
                ),
                Container(
                  width: 21,
                  margin: AppPaddings.all12,
                  height: 25,
                  decoration: BoxDecoration(
                    color: AppColors.cardColor(context),
                    borderRadius: AppRadius.r24,
                  ),
                ),
              ],
            ),
          ),
        );
}