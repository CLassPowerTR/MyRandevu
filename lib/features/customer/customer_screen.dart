import 'package:flutter/material.dart';
import 'package:my_randevu/core/constants/app_colors.dart';
import 'package:my_randevu/core/constants/app_strings.dart';
import 'package:my_randevu/core/routes/app_routes.dart';
import 'package:my_randevu/core/widgets/app_bar/appointment_appbar.dart';
import 'package:my_randevu/core/widgets/buttons/text_button_started.dart';

part 'views/customer_body_view.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppointmentAppbar(title: AppStrings.customerHome),
      body: _CustomerBodyView(),
    );
  }
}
