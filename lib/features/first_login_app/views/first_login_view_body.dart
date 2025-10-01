part of '../first_login_screen.dart';

class _FirstLoginViewBody extends StatefulWidget {
  const _FirstLoginViewBody({super.key});

  @override
  State<_FirstLoginViewBody> createState() => __FirstLoginViewBodyState();
}

class __FirstLoginViewBodyState extends State<_FirstLoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12,
        children: [
          textButtonStarted(context, AppStrings.businessLogin, () async {
            await saveFirstOpenOption('isletmeGirisi');
            Navigator.pushNamed(context, AppRoutes.isletmeGirisi);
          }),
          textButtonStarted(
            context,
            backgroundColor: AppColors.textColor(context),
            AppStrings.customerLogin,
            () async {
              await saveFirstOpenOption('musteriGirisi');
              Navigator.pushNamed(context, AppRoutes.musteriGirisi);
            },
          ),
        ],
      ),
    );
  }
}
