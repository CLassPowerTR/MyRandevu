part of '../appointment_chose_business_screen.dart';

Widget _choseBusinessCard(BuildContext context, Isletme item) {
  return Card(
    elevation: 4,
    shadowColor: AppColors.shadow(context),
    shape: RoundedRectangleBorder(borderRadius: AppRadius.r12),
    color: AppColors.surface(context),
    child: Padding(
      padding: AppPaddings.all12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          // Logo üstte
          normalLogoContainer(
            context: context,
            imageUrl:
                '${ApiConfig().siteUrl}img/isletmeler/${item.isletmeLogosu}',
          ),

          // Isletme_Adi - Sube_Tipi
          Text(
            '${item.isletmeAdi} - ${item.subeTipi}',
            style: AppTextStyle.header(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          // Isletme_Turu
          Text(
            '${item.isletmeTuru}',
            style: AppTextStyle.bodyMediumBold(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          // Adres satırı
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Adres: ',
                  style: AppTextStyle.bodyMediumBold(context),
                ),
                TextSpan(
                  text: '${item.subeAdresi}',
                  style: AppTextStyle.bodyMediumMuted(context),
                ),
                TextSpan(
                  text: item.subeIlceAdi.isNotEmpty
                      ? ' ${item.subeIlceAdi} - ${item.subeIlAdi}'
                      : '-',
                  style: AppTextStyle.bodyMediumMuted(context),
                ),
              ],
            ),
          ),

          // Telefon
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: [
              Icon(Icons.phone, size: 16, color: AppColors.textColor(context)),
              Text(
                '${item.subeTelefonu}',
                style: AppTextStyle.bodyMedium(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Randevu Al butonu (alt orta)
          Align(
            alignment: Alignment.bottomCenter,
            child: textButtonAppointment(
              context,
              AppStrings.takeAppointment,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AppointmentChoseDateScreen(selectedBusiness: item),
                  ),
                );
              },
              width: MediaQuery.of(context).size.width * 0.35,
              backgroundColor: AppColors.orange(context),
            ),
          ),
        ],
      ),
    ),
  );
}
