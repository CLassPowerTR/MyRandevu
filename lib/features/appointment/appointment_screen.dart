import 'package:flutter/material.dart';
import 'package:my_randevu/core/widgets/app_bar/appointment_appbar.dart';

part 'views/appointment_delete_body_view.dart';
part 'views/appointment_take_body_view.dart';

class AppointmentScreen extends StatefulWidget {
  final String? appointmentFunction;
  const AppointmentScreen({super.key, this.appointmentFunction});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (widget.appointmentFunction == 'take') {
            return const _AppointmentTakeBodyView();
          } else if (widget.appointmentFunction == 'delete') {
            return const _AppointmentDeleteBodyView();
          } else {
            return Center(child: Text('Geçersiz İşlem'));
          }
        },
      ),
    );
  }
}
