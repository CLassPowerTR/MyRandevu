part of '../appointment_chose_business_screen.dart';

Widget _choseBusinessCard(BuildContext context, Map<String, dynamic> item) {
            final String isletmeAdi = (item['Isletme_Adi'] ?? '').toString();
          final String subeTipi = (item['Sube_Tipi'] ?? '').toString();
          final String isletmeTuru = (item['Isletme_Turu'] ?? '').toString();
          final String isletmeAdresi = (item['Isletme_Adresi'] ?? '')
              .toString();
          final String subeIlce = (item['Sube_Ilce_Adi'] ?? '').toString();
          final String subeIl = (item['Sube_Il_Adi'] ?? '').toString();
          final dynamic telefonRaw = item['Sube_Telefonu'];
          final String telefon = telefonRaw == null
              ? '-'
              : telefonRaw.toString();
          final String logo = (item['Isletme_Logosu'] ?? '').toString();
  
  return Card(
            elevation: 4,
            shadowColor: AppColors.shadow(context),
            shape: RoundedRectangleBorder(borderRadius: AppRadius.r12),
            color: AppColors.surface(context),
            child: Padding(
              padding: AppPaddings.all12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 8,
                children: [
                  // Logo üstte
                  Center(
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.orange(context),
                      child: logo.isNotEmpty
                          ? ClipOval(
                              child: SizedBox(
                                width: 52,
                                height: 52,
                                child: Image.network(
                                  '${ApiConfig().baseUrl}img/isletmeler/$logo',
                                  fit: BoxFit.cover,
                                  errorBuilder: (c, e, s) => Icon(
                                    Icons.store,
                                    color: AppColors.surface(context),
                                  ),
                                ),
                              ),
                            )
                          : Icon(
                              Icons.store,
                              size: 30,
                              color: AppColors.surface(context),
                            ),
                    ),
                  ),
                  // Isletme_Adi - Sube_Tipi
                  Text(
                    '$isletmeAdi - $subeTipi',
                    style: AppTextStyle.header(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Isletme_Turu
                  Text(
                    isletmeTuru,
                    style: AppTextStyle.bodyMedium(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Adres satırı
                  RichText(text: TextSpan(children: [
                    TextSpan(text: 'Adres: ', style: AppTextStyle.bodySmallBold(context)),
                    TextSpan(text: isletmeAdresi, style: AppTextStyle.bodySmallMuted(context)),
                    TextSpan(text: subeIlce.isNotEmpty ? ' $subeIlce - $subeIl' : subeIl, style: AppTextStyle.bodySmallMuted(context)),
                  ])),

                  // Telefon
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 16,
                        color: AppColors.textColor(context),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          telefon,
                          style: AppTextStyle.bodyMedium(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Randevu Al butonu (alt orta)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: textButtonAppointment(context, 'Randevu Al',(){},width: MediaQuery.of(context).size.width * 0.35,backgroundColor: AppColors.orange(context))
                  ),
                ],
              ),
            ),
          );
}