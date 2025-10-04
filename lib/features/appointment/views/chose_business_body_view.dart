part of '../appointment_chose_business_screen.dart';

class _ChoseBusinessBodyView extends StatefulWidget {
  final Il? selectedProvince;
  const _ChoseBusinessBodyView({super.key, this.selectedProvince});

  @override
  State<_ChoseBusinessBodyView> createState() => __ChoseBusinessBodyViewState();
}

class __ChoseBusinessBodyViewState extends State<_ChoseBusinessBodyView> {
  Future<List<Isletme>>? _fetchBusinessesFuture;

  @override
  void initState() {
    super.initState();
    _fetchBusinessesFuture = ApiService.getBusiness(
      widget.selectedProvince!.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Isletme>>(
      future: _fetchBusinessesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return choseBusinessShimmer(context);
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Hata: ${snapshot.error}',
              style: AppTextStyle.bodyMediumMuted(context),
            ),
          );
        } else if (snapshot.hasData) {
          final data = snapshot.data!;
          return _buildBusinessList(data);
        } else {
          return Center(
            child: Text(
              AppStrings.noDataFound,
              style: AppTextStyle.bodyMediumMuted(context),
            ),
          );
        }
      },
    );
  }

  Widget _buildBusinessList(List<Isletme> selectedBusiness) {
    if (selectedBusiness.isEmpty) {
      return Center(
        child: Text(
          AppStrings.noDataFound,
          style: AppTextStyle.bodyMediumMuted(context),
        ),
      );
    }

    return Padding(
      padding: AppPaddings.h16,
      child: ListView.separated(
        itemCount: selectedBusiness.length,
        separatorBuilder: (context, _) => const SizedBox(height: 12),
        itemBuilder: (ctx, index) {
          final Isletme item = selectedBusiness[index];
          return _choseBusinessCard(context, item);
        },
      ),
    );
  }
}
