part of '../appointment_screen.dart';

Widget _choseProvicesDropdown(
  BuildContext context,
  Il? selected,
  final data,
  ValueChanged<Il?>? onChanged,
) {
  return DropdownButtonFormField<Il>(
    value: selected,
    items: data
        .map((il) => DropdownMenuItem<Il>(value: il, child: Text(il.isim)))
        .toList(),
    onChanged: onChanged,
    decoration: InputDecoration(
      contentPadding: AppPaddings.h10,
      border: OutlineInputBorder(
        borderRadius: AppRadius.r24,
        borderSide: BorderSide(color: AppColors.outline(context)),
      ),
    ),
  );
}
