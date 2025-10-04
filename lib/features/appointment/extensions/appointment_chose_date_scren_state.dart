part of '../views/appointment_chose_date_view.dart';

extension on _AppointmentChoseDateScreenState {
  Widget _buildServicesTab(BuildContext context, IsletmeDetayData detail) {
    return ListView(
      padding: AppPaddings.all12,
      children: [
        const SizedBox(height: 8),
        _buildExpansionPanels(context, detail),
      ],
    );
  }

  Widget _buildExpansionPanels(BuildContext context, IsletmeDetayData detail) {
    final Map<String, List<IsletmeDetayHizmet>> grouped =
        <String, List<IsletmeDetayHizmet>>{};
    for (final IsletmeDetayHizmet h in detail.hizmetler) {
      grouped.putIfAbsent(h.anaHizmetAdi, () => <IsletmeDetayHizmet>[]).add(h);
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary(context).withOpacity(0.3),
        borderRadius: AppRadius.r12,

        boxShadow: [
          BoxShadow(
            color: AppColors.shadow(context).withOpacity(0.08),
            blurRadius: 8,

            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ExpansionPanelList.radio(
        //dividerColor: AppColors.outline(context),
        expandIconColor: AppColors.textColor(context),
        animationDuration: const Duration(milliseconds: 600),

        elevation: 2,
        expandedHeaderPadding: EdgeInsets.zero,
        children: grouped.entries.map<ExpansionPanelRadio>((
          MapEntry<String, List<IsletmeDetayHizmet>> entry,
        ) {
          final String groupName = entry.key;
          final List<IsletmeDetayHizmet> items = entry.value;
          return ExpansionPanelRadio(
            backgroundColor: AppColors.cardColor(context),

            highlightColor: AppColors.notificationColor(context),
            splashColor: AppColors.orange(context),
            canTapOnHeader: true,
            value: groupName,
            headerBuilder: (context, isOpen) {
              return Padding(
                padding: AppPaddings.h12,
                child: Text(
                  groupName,
                  style: AppTextStyle.bodyLargeBold(context),
                  maxLines: 1,
                  textAlign: TextAlign.start,

                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
            body: Container(
              width: double.infinity,
              padding: AppPaddings.all12,
              decoration: BoxDecoration(
                color: AppColors.primary(context),

                //borderRadius: AppRadius.r12,
                border: Border(
                  top: BorderSide(
                    color: AppColors.outline(context).withOpacity(0.3),
                  ),
                ),
              ),
              child: Column(
                spacing: 8,
                children: items.map((IsletmeDetayHizmet s) {
                  final String price = _formatPrice(
                    s.hizmetFiyatAlt,
                    s.hizmetFiyatUst,
                  );
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          s.altHizmetAdi,
                          style: AppTextStyle.bodyMediumBold(context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: AppPaddings.h10v10,
                        decoration: BoxDecoration(
                          color: AppColors.cardColor(context),
                          borderRadius: AppRadius.r24,
                        ),
                        child: Text(
                          price,
                          style: AppTextStyle.bodyMediumBold(
                            context,
                            color: AppColors.textColor(context),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      textButtonAppointment(
                        context,
                        AppStrings.takeAppointment,
                        () {
                          // TODO: Randevu alma akışına yönlendirme (s.id veya alt hizmet id ile)
                        },
                        backgroundColor: AppColors.orange(context),
                        width: 100,
                        padding: AppPaddings.h10v10,
                        borderRadius: AppRadius.r24,
                        textStyle: AppTextStyle.bodySmallBold(
                          context,
                          color: AppColors.surface(context),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAboutTab(BuildContext context, IsletmeDetayData detail) {
    final IsletmeDetay b = detail.isletme;
    return ListView(
      padding: AppPaddings.all12,
      children: [
        const SizedBox(height: 8),
        _infoTile(
          context,
          icon: Icons.info_outline,
          title: 'Hakkında',
          value: b.isletmeHakkindaMetni.isNotEmpty
              ? b.isletmeHakkindaMetni
              : b.isletmeAdi,
        ),
        _infoTile(
          context,
          icon: Icons.place_outlined,
          title: 'Adres',
          value:
              '${b.subeAdresi} ${b.subeIlceAdi.isNotEmpty ? b.subeIlceAdi : ''}/${b.subeIlAdi.isNotEmpty ? b.subeIlAdi : ''}',
        ),
        _infoTile(
          context,
          icon: Icons.phone_outlined,
          title: 'Telefon',
          value: b.subeTelefonu ?? '-',
        ),
        _workingHoursSection(context, detail.calismaSaatleri),
        _infoTile(
          context,
          icon: Icons.location_on_outlined,
          title: 'Konum',
          value: b.subeGeocode.isNotEmpty ? b.subeGeocode : '-',
        ),
      ],
    );
  }

  String _formatPrice(String alt, String ust) {
    final String altTL = alt.trim().isEmpty
        ? '-'
        : '₺${alt.replaceAll('.00', '')}';
    if (ust.trim().isEmpty || ust == '0.00' || ust == '0') {
      return altTL;
    }
    final String ustTL = '₺${ust.replaceAll('.00', '')}';
    return '$altTL - $ustTL';
  }

  Widget _workingHoursSection(
    BuildContext context,
    List<IsletmeDetayCalismaSaati> list,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: AppPaddings.all12,
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: AppRadius.r12,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow(context).withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [
          Row(
            children: [
              Icon(
                Icons.schedule_outlined,
                color: AppColors.textColor(context),
              ),
              const SizedBox(width: 10),
              Text(
                'Çalışma Saatleri',
                style: AppTextStyle.bodyMediumBold(context),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...list.map((e) => _dayRow(context, e)).toList(),
        ],
      ),
    );
  }

  Widget _dayRow(BuildContext context, IsletmeDetayCalismaSaati s) {
    final bool isHoliday =
        s.tatil == '1' ||
        (s.acilisSaati == '00:00:00' && s.kapanisSaati == '00:00:00');
    final String acilis = _hhmm(s.acilisSaati);
    final String kapanis = _hhmm(s.kapanisSaati);
    final String ogleBas = _hhmm(s.ogleArasiBas);
    final String ogleBit = _hhmm(s.ogleArasiBit);
    String saatStr;
    if (isHoliday) {
      saatStr = 'Tatil';
    } else if (s.ogleArasiDurumu == '1' &&
        ogleBas != '00:00' &&
        ogleBit != '00:00') {
      saatStr = '$acilis - $ogleBas / $ogleBit - $kapanis';
    } else {
      saatStr = '$acilis - $kapanis';
    }
    return Container(
      width: double.infinity,
      padding: AppPaddings.h10v10,
      decoration: BoxDecoration(
        color: isHoliday
            ? AppColors.notificationColor(context).withOpacity(0.6)
            : s.ogleArasiDurumu == '1'
            ? AppColors.orange(context).withOpacity(0.4)
            : AppColors.cardColor(context),
        borderRadius: AppRadius.r8,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow(context).withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(s.gunAdi, style: AppTextStyle.bodyMediumBold(context)),
          Text(saatStr, style: AppTextStyle.bodyMedium(context)),
        ],
      ),
    );
  }

  String _hhmm(String hhmmss) {
    if (hhmmss.length >= 5) {
      return hhmmss.substring(0, 5);
    }
    return hhmmss;
  }

  Widget _infoTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? value,
    Widget Function(BuildContext)? widget,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: AppPaddings.all12,
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: AppRadius.r12,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow(context).withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(icon, color: AppColors.textColor(context)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(title, style: AppTextStyle.bodyMediumBold(context)),
                Builder(
                  builder: (context) {
                    if (value != null) {
                      return Text(
                        value,
                        style: AppTextStyle.bodyMedium(context),
                      );
                    } else {
                      return widget?.call(context) ?? const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
