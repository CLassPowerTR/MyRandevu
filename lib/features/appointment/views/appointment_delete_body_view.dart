part of '../appointment_screen.dart';

class _AppointmentDeleteBodyView extends StatefulWidget {
  const _AppointmentDeleteBodyView({super.key});

  @override
  State<_AppointmentDeleteBodyView> createState() =>
      __AppointmentDeleteBodyViewState();
}

class __AppointmentDeleteBodyViewState
    extends State<_AppointmentDeleteBodyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralUseAppBar(title: AppStrings.deleteAppointment),
      body: SafeArea(
        child: Center(
          child: Text(
            'Randevu İptal Ekranı',
            style: AppTextStyle.header(context),
          ),
        ),
      ),
    );
  }
}
