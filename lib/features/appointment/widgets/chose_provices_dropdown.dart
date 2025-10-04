part of '../appointment_screen.dart';

Widget _choseProvicesDropdown(
  BuildContext context,
  Il? selected,
  List<Il> data,
  ValueChanged<Il?>? onChanged,
) {
  final List<DropdownMenuItem<Il>> items = data
      .map<DropdownMenuItem<Il>>(
        (Il il) => DropdownMenuItem<Il>(value: il, child: Text(il.isim)),
      )
      .toList();

  return DropdownButtonFormField<Il>(
    // hide internal default icon and use suffixIcon in decoration to ensure it's at the far right
    icon: Icon(
      size: AppTextStyle.header(context).fontSize! + 8,
      Icons.arrow_drop_down_outlined,
      color: AppColors.textColor(context),
    ),
    value: selected,
    items: items,
    onChanged: onChanged,
    hint: Text(AppStrings.provinceChoose),
    decoration: InputDecoration(
      contentPadding: AppPaddings.h10,
      border: OutlineInputBorder(
        borderRadius: AppRadius.r24,
        borderSide: BorderSide(color: AppColors.outline(context)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.r24,
        borderSide: BorderSide(color: AppColors.outline(context)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.r24,
        borderSide: BorderSide(color: AppColors.outline(context)),
      ),
      // sağda aşağı ok ikonu
      suffixIcon: Icon(
        Icons.arrow_drop_down,
        color: AppColors.textColor(context),
      ),
    ),
  );
}
