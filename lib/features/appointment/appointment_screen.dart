import 'package:flutter/material.dart';
import 'package:my_randevu/core/api/api_service.dart';
import 'package:my_randevu/core/constants/app_colors.dart';
import 'package:my_randevu/core/constants/app_paddings.dart';
import 'package:my_randevu/core/constants/app_radius.dart';
import 'package:my_randevu/core/constants/app_strings.dart';
import 'package:my_randevu/core/constants/app_text_styles.dart';
import 'package:my_randevu/core/enums/assets/app_icons.dart';
import 'package:my_randevu/core/models/il_model.dart';
import 'package:my_randevu/core/models/isletmeler_model.dart';
import 'package:my_randevu/core/routes/app_routes.dart';
import 'package:my_randevu/core/shimmer/dropdown_shimmer.dart';
import 'package:my_randevu/core/widgets/app_bar/appointment_appbar.dart';
import 'package:my_randevu/core/widgets/buttons/text_button_appointment.dart';
import 'package:my_randevu/core/widgets/text_form_field/text_form_field_appointment.dart';
import 'package:shimmer/shimmer.dart';

part 'views/appointment_delete_body_view.dart';
part 'views/appointment_take_body_view.dart';
part 'widgets/appointment_search_location_card.dart';
part 'extensions/getProvince.dart';
part 'widgets/chose_provices_dropdown.dart';

class AppointmentScreen extends StatefulWidget {
  final String? appointmentFunction;
  const AppointmentScreen({super.key, this.appointmentFunction});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _AppointmentTakeBodyView());
  }
}
