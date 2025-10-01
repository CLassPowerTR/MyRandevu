import 'package:flutter/material.dart';
import 'package:my_randevu/core/widgets/buttons/turn_back_button.dart';

class AppointmentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppointmentAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Randevu Al'),
      centerTitle: true,
      leading: TurnBackTextIconButton(context),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
