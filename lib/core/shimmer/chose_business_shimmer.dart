import 'package:flutter/material.dart';
import 'package:my_randevu/core/constants/app_colors.dart';
import 'package:my_randevu/core/constants/app_paddings.dart';
import 'package:my_randevu/core/constants/app_radius.dart';
import 'package:shimmer/shimmer.dart';

Widget choseBusinessShimmer(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: AppColors.outline(context).withOpacity(0.5),
    highlightColor: AppColors.surface(context).withOpacity(0.2),
    child: Padding(
      padding: AppPaddings.h16,
      child: ListView.separated(
        itemCount: 6,
        separatorBuilder: (context, _) => const SizedBox(height: 12),
        itemBuilder: (ctx, index) => Card(
          elevation: 0,
          shadowColor: AppColors.shadow(context),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.r12),
          color: AppColors.outline(context).withOpacity(0.3),
          child: Padding(
            padding: AppPaddings.all12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                // Logo placeholder (üstte tam genişlik)
                _container(
                  context,
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: MediaQuery.of(context).size.height * 0.1,
                  borderRadius: AppRadius.r12,
                ),
                // Başlık satırı (İşletme Adı - Şube Tipi)
                _container(
                  context,
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: Theme.of(context).textTheme.headlineSmall!.fontSize!,
                  margin: EdgeInsets.all(4),
                ),

                // Alt başlık (İşletme Türü)
                _container(
                  context,
                  height: Theme.of(context).textTheme.bodyMedium!.fontSize,
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: EdgeInsets.all(4),
                ),
                // Adres satırı ("Adres:" etiketi + adres bloğu)
                _container(
                  context,
                  height: 28,
                  width: double.infinity,
                  margin: EdgeInsets.all(4),
                ),
                // Telefon satırı (ikon + numara bloğu)
                _container(
                  context,
                  height: Theme.of(context).textTheme.bodyMedium!.fontSize,
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: EdgeInsets.all(4),
                ),
                const SizedBox(height: 12),
                // Randevu Al butonu placeholder (alt orta)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _container(
                    context,
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.35,
                    borderRadius: AppRadius.r12,
                    margin: EdgeInsets.all(4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Container _container(
  BuildContext context, {
  double? width,
  double? height,
  EdgeInsetsGeometry? margin,
  BorderRadiusGeometry? borderRadius,
}) {
  return Container(
    height: height ?? 100,
    width: width ?? 100,
    margin: margin ?? EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: AppColors.outline(context).withOpacity(0.6),
      borderRadius: borderRadius ?? AppRadius.r8,
    ),
  );
}
