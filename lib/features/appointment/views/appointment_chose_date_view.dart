import 'package:flutter/material.dart';
import 'package:my_randevu/core/api/api_config.dart';
import 'package:my_randevu/core/constants/app_strings.dart';
import 'package:my_randevu/core/constants/app_text_styles.dart';
import 'package:my_randevu/core/constants/app_colors.dart';
import 'package:my_randevu/core/constants/app_paddings.dart';
import 'package:my_randevu/core/constants/app_radius.dart';
import 'package:my_randevu/core/api/api_service.dart';
import 'package:my_randevu/core/models/isletme_detay.dart';
import 'package:my_randevu/core/models/isletmeler_model.dart';
import 'package:my_randevu/core/widgets/app_bar/appointment_appbar.dart';
import 'package:my_randevu/core/widgets/container/normal_logo_container.dart';
import 'package:my_randevu/core/widgets/buttons/text_button_appointment.dart';
import 'package:shimmer/shimmer.dart';

part '../extensions/appointment_chose_date_scren_state.dart';
part '../../../core/shimmer/business_detail_shimmer.dart';

class AppointmentChoseDateScreen extends StatefulWidget {
  final Isletme selectedBusiness;
  const AppointmentChoseDateScreen({super.key, required this.selectedBusiness});

  @override
  State<AppointmentChoseDateScreen> createState() =>
      _AppointmentChoseDateScreenState();
}

class _AppointmentChoseDateScreenState
    extends State<AppointmentChoseDateScreen> {
  Future<IsletmeDetayData>? _detailFuture;
  final Set<String> _expandedGroups = <String>{};

  @override
  void initState() {
    super.initState();
    _detailFuture = ApiService.getBusinessDetail(
      widget.selectedBusiness.isletmeId,
      subeID: widget.selectedBusiness.subeId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralUseAppBar(title: widget.selectedBusiness.isletmeAdi),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: [
              Padding(
                padding: AppPaddings.h12,
                child: normalLogoContainer(
                  height: MediaQuery.of(context).size.height * 0.16,
                  context: context,
                  imageUrl:
                      '${ApiConfig().siteUrl}img/isletmeler/${widget.selectedBusiness.isletmeLogosu}',
                ),
              ),
              Padding(
                padding: AppPaddings.h12,
                child: TabBar(
                  indicatorColor: AppColors.accentColor(context),
                  labelColor: AppColors.textColor(context),
                  dividerColor: AppColors.primary(context),
                  unselectedLabelStyle: AppTextStyle.bodyLarge(context),
                  labelStyle: AppTextStyle.bodyLargeBold(context),
                  tabs: const [
                    Tab(text: 'Hizmetler'),
                    Tab(text: 'Hakkında'),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<IsletmeDetayData>(
                  future: _detailFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return _buildLoadingShimmer(context);
                    }
                    if (snapshot.hasError) {
                      return Padding(
                        padding: AppPaddings.all12,
                        child: Text(
                          'Hata: ${snapshot.error}',
                          style: AppTextStyle.bodyMediumMuted(context),
                        ),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text(
                          AppStrings.noDataFound,
                          style: AppTextStyle.bodyMediumMuted(context),
                        ),
                      );
                    }
                    final IsletmeDetayData detail = snapshot.data!;
                    return TabBarView(
                      children: [
                        _buildServicesTab(context, detail),
                        _buildAboutTab(context, detail),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
