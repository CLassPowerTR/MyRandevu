import 'package:flutter/material.dart';
import 'package:my_randevu/core/constants/app_colors.dart';
import 'package:my_randevu/core/constants/app_text_styles.dart';
import 'package:my_randevu/core/widgets/buttons/turn_back_button.dart';

class GeneralUseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const GeneralUseAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? 'MyRandevu',

        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor(context),
        ),
      ),
      centerTitle: true,
      leadingWidth: MediaQuery.of(context).size.width * 0.3,
      leading: TurnBackTextIconButton(context),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppointmentAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const AppointmentAppbar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? 'MyRandevu',
        style: AppTextStyle.bodyLargeBold(context),
      ),
      centerTitle: true,
      //leadingWidth: MediaQuery.of(context).size.width * 0.3,
      //leading: TurnBackTextIconButton(context),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
