part of '../appointment_screen.dart';

Center _appointmentSearchLocationCard(
  BuildContext context,
  VoidCallback setState,
) {
  Il? selectedProvince;
  Il nullValue = Il(id: 1, isim: 'Adana');
  return Center(
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Card(
        margin: AppPaddings.h16,
        color: AppColors.surface(context),
        elevation: 4,
        shadowColor: AppColors.shadow(context),
        child: Padding(
          padding: AppPaddings.all16,
          child: Column(
            spacing: 12,
            children: [
              _headerText(context),
              _choseLocation(context, selectedProvince, nullValue),
              SizedBox(height: 8),
              textButtonAppointment(
                context,
                backgroundColor: AppColors.notificationColor(context),

                AppStrings.deleteAppointment,
                () {
                  setState();
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Card _choseLocation(BuildContext context, Il? selectedProvince, Il nullValue) {
  return Card(
    elevation: 4,
    shadowColor: AppColors.shadow(context),
    margin: AppPaddings.t24,
    color: AppColors.surface(context),
    child: Padding(
      padding: AppPaddings.all12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 6,
            children: [
              Icon(AppIcons.search, color: AppColors.textColor(context)),
              Expanded(child: textFormFieldAppointment(context: context)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 6,
            children: [
              Icon(AppIcons.location, color: AppColors.textColor(context)),
              Expanded(
                child: _provinceDropdownFromFuture(
                  context: context,
                  initialValue: selectedProvince,
                  emptyMessage: 'İl bulunamadı',
                  onChanged: (Il? il) {
                    selectedProvince = il;
                  },
                ),
              ),
            ],
          ),
          textButtonAppointment(context, AppStrings.search, () {
            Navigator.pushNamed(
              context,
              AppRoutes.choseBusinessScreen,
              arguments: selectedProvince ?? nullValue,
            );
          }),
        ],
      ),
    ),
  );
}

Row _headerText(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    spacing: 12,
    children: [
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: AppColors.orange(context),
          borderRadius: AppRadius.r30,
        ),
        child: Icon(
          AppIcons.location,
          size: 40,
          color: AppColors.surface(context),
        ),
      ),
      Expanded(
        child: RichText(
          maxLines: 5,
          textAlign: TextAlign.center,
          text: TextSpan(
            spellOut: true,
            text: '${AppStrings.searchBusinessandLocation}\n\n',
            children: [
              TextSpan(
                text: '${AppStrings.takeAppointmentDescription}',
                style: AppTextStyle.bodyMediumMuted(context),
              ),
            ],

            style: AppTextStyle.header(context),
          ),
        ),
      ),
    ],
  );
}
