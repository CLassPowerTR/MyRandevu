part of '../appointment_screen.dart';

/// Future<List<Il>> alır, FutureBuilder ile yükleme/hata/boş durumlarını işler
/// ve başarı durumunda DropdownButtonFormField<Il> döner.
/// - [provincesFuture]: API'den dönen future
/// - [initialValue]: opsiyonel başlangıç seçimi
/// - [onChanged]: seçim değiştiğinde çağrılır
Widget _provinceDropdownFromFuture({
  required BuildContext context,
  required Future<List<Il>> provincesFuture,
  Il? initialValue,
  ValueChanged<Il?>? onChanged,
  String? emptyMessage,
}) {
  return FutureBuilder<List<Il>>(
    future: provincesFuture,
    builder: (ctx, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const SizedBox(
          height: 48,
          child: Center(child: CircularProgressIndicator()),
        );
      }

      if (snapshot.hasError) {
        final String message = snapshot.error?.toString() ?? 'Veri yüklenemedi';
        return Row(
          children: [
            Icon(Icons.warning, color: AppColors.notificationColor(context)),
            const SizedBox(width: 8),
            Expanded(
              child: SizedBox(
                height: 120,
                child: SingleChildScrollView(
                  child: Text(
                    message,
                    style: AppTextStyle.bodyMediumMuted(context),
                  ),
                ),
              ),
            ),
          ],
        );
      }

      final data = snapshot.data ?? [];
      if (data.isEmpty) {
        return Row(
          children: [
            Icon(Icons.info_outline, color: AppColors.textColor(context)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                emptyMessage ?? AppStrings.noDataFound,
                style: AppTextStyle.bodyMediumMuted(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      }

      Il? selected = initialValue ?? data.first;

      return StatefulBuilder(
        builder: (ctx, setState) {
          return _choseProvicesDropdown(context, selected, data, (v) {
            setState(() => selected = v);
            if (onChanged != null) onChanged(v);
          });
        },
      );
    },
  );
}
