part of '../appointment_screen.dart';

class _AppointmentTakeBodyView extends StatefulWidget {
  const _AppointmentTakeBodyView({super.key});

  @override
  State<_AppointmentTakeBodyView> createState() =>
      __AppointmentTakeBodyViewState();
}

class __AppointmentTakeBodyViewState extends State<_AppointmentTakeBodyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppointmentAppBar(),
      body: Center(child: Text('Randevu Alma Ekranı')),
    );
  }
}
