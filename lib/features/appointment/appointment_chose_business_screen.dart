import 'package:flutter/material.dart';
import 'package:my_randevu/core/api/api_config.dart';
import 'package:my_randevu/core/api/api_service.dart';
import 'package:my_randevu/core/constants/app_colors.dart';
import 'package:my_randevu/core/constants/app_paddings.dart';
import 'package:my_randevu/core/constants/app_radius.dart';
import 'package:my_randevu/core/constants/app_strings.dart';
import 'package:my_randevu/core/constants/app_text_styles.dart';
import 'package:my_randevu/core/enums/assets/app_images.dart';
import 'package:my_randevu/core/models/il_model.dart';
import 'package:my_randevu/core/models/isletmeler_model.dart';
import 'package:my_randevu/core/shimmer/chose_business_shimmer.dart';
import 'package:my_randevu/core/widgets/app_bar/appointment_appbar.dart';
import 'package:my_randevu/core/widgets/buttons/text_button_appointment.dart';
import 'package:my_randevu/core/widgets/container/normal_logo_container.dart';
import 'package:my_randevu/features/appointment/views/appointment_chose_date_view.dart';
import 'package:shimmer/shimmer.dart';

part 'views/chose_business_body_view.dart';
part 'widgets/chose_business_card.dart';

class ChoseBusinessScreen extends StatefulWidget {
  final Il? selectedProvince;
  const ChoseBusinessScreen({super.key, this.selectedProvince});

  @override
  State<ChoseBusinessScreen> createState() => _ChoseBusinessScreenState();
}

class _ChoseBusinessScreenState extends State<ChoseBusinessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralUseAppBar(title: 'İşletme Seç'),
      body: _ChoseBusinessBodyView(selectedProvince: widget.selectedProvince),
    );
  }
}
