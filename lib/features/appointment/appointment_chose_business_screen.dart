import 'package:flutter/material.dart';
import 'package:my_randevu/core/api/api_config.dart';
import 'package:my_randevu/core/constants/app_colors.dart';
import 'package:my_randevu/core/constants/app_paddings.dart';
import 'package:my_randevu/core/constants/app_radius.dart';
import 'package:my_randevu/core/constants/app_strings.dart';
import 'package:my_randevu/core/constants/app_text_styles.dart';
import 'package:my_randevu/core/widgets/app_bar/appointment_appbar.dart';
import 'package:my_randevu/core/widgets/buttons/text_button_appointment.dart';

part 'views/chose_business_body_view.dart';
part 'widgets/chose_business_card.dart';

class ChoseBusinessScreen extends StatefulWidget {
  const ChoseBusinessScreen({super.key});

  @override
  State<ChoseBusinessScreen> createState() => _ChoseBusinessScreenState();
}

class _ChoseBusinessScreenState extends State<ChoseBusinessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralUseAppBar(title: 'İşletme Seç'),
      body: _ChoseBusinessBodyView(),
    );
  }
}
