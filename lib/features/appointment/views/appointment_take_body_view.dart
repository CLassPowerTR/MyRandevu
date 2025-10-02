part of '../appointment_screen.dart';

class _AppointmentTakeBodyView extends StatefulWidget {
  const _AppointmentTakeBodyView({super.key});

  @override
  State<_AppointmentTakeBodyView> createState() =>
      __AppointmentTakeBodyViewState();
}

class __AppointmentTakeBodyViewState extends State<_AppointmentTakeBodyView> {
  // Future olarak saklayıp UI'ya doğrudan ileteceğiz
  late Future<List<Il>> _provincesFuture;

  @override
  void initState() {
    super.initState();
    _provincesFuture = ApiService.getProvinces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralUseAppBar(title: AppStrings.takeAppointment),
      body: SafeArea(
        // _appointmentSearchLocationCard daha önce Future<List<Il>> kabul edecek şekilde güncellenmişti
        child: _appointmentSearchLocationCard(context, _provincesFuture),
      ),
    );
  }
}
