part of '../../features/appointment/views/appointment_chose_date_view.dart';

extension _LoadingSkeleton on _AppointmentChoseDateScreenState {
  Widget _buildLoadingShimmer(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppPaddings.all12,
        child: Shimmer.fromColors(
          baseColor: AppColors.outline(context),
          highlightColor: AppColors.surface(context).withOpacity(0.9),
          child: Column(children: [_shimmerGroup(context)]),
        ),
      ),
    );
  }

  Widget _shimmerGroup(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary(context).withOpacity(0.3),
        //borderRadius: AppRadius.r12,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow(context).withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          _inContainerShimmer(context),
          _inContainerShimmer(context),
          _inContainerShimmer(context),
          _inContainerShimmer(context),
          _inContainerShimmer(context),
          _inContainerShimmer(context),
          _inContainerShimmer(context),
        ],
      ),
    );
  }

  Padding _inContainerShimmer(BuildContext context) {
    return Padding(
      padding: AppPaddings.h10v10,
      child: Row(
        children: [
          Container(
            height: 24,
            width: 250,
            decoration: BoxDecoration(
              color: AppColors.outline(context),
              borderRadius: AppRadius.r8,
            ),
          ),
          const Spacer(),
          Container(
            height: 24,
            width: 25,
            decoration: BoxDecoration(
              color: AppColors.outline(context),
              borderRadius: AppRadius.r8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _shimmerItemRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 16,
            decoration: BoxDecoration(
              color: AppColors.outline(context),
              borderRadius: AppRadius.r8,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 64,
          height: 26,
          decoration: BoxDecoration(
            color: AppColors.outline(context),
            borderRadius: AppRadius.r24,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 100,
          height: 34,
          decoration: BoxDecoration(
            color: AppColors.outline(context),
            borderRadius: AppRadius.r24,
          ),
        ),
      ],
    );
  }
}
