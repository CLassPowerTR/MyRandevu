part of '../customer_screen.dart';

class _CustomerBodyView extends StatefulWidget {
  const _CustomerBodyView({super.key});

  @override
  State<_CustomerBodyView> createState() => __CustomerBodyViewState();
}

class __CustomerBodyViewState extends State<_CustomerBodyView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12,
        children: [
          textButtonStarted(
            context,
            AppStrings.takeAppointment,
            () {
              Navigator.pushNamed(
                context,
                AppRoutes.appointmentScreen,
                arguments: 'take',
              );
            },
            backgroundColor: AppColors.textColor(context),
          ),
          textButtonStarted(
            context,
            AppStrings.deleteAppointment,
            () {
              Navigator.pushNamed(
                context,
                AppRoutes.appointmentScreen,
                arguments: 'delete',
              );
            },
            backgroundColor: AppColors.notificationColor(context),
          ),
        ],
      ),
    );
  }
}
