import 'package:flutter/material.dart';
import 'package:my_randevu/core/models/il_model.dart';
import 'package:my_randevu/core/models/isletmeler_model.dart';
import 'package:my_randevu/core/routes/app_routes.dart';
import 'package:my_randevu/features/appointment/appointment_chose_business_screen.dart';
import 'package:my_randevu/features/appointment/appointment_screen.dart';
import 'package:my_randevu/features/appointment/views/appointment_chose_date_view.dart';
import 'package:my_randevu/features/first_login_app/first_login_screen.dart';
import 'package:my_randevu/features/splash/splash_screen.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.isletmeGirisi:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.musteriGirisi:
        return MaterialPageRoute(
          builder: (_) => AppointmentScreen(appointmentFunction: 'take'),
        );
      case AppRoutes.choseBusinessScreen:
        return MaterialPageRoute(
          builder: (_) =>
              ChoseBusinessScreen(selectedProvince: settings.arguments as Il?),
        );
      case AppRoutes.choseDateScreen:
        return MaterialPageRoute(
          builder: (_) => AppointmentChoseDateScreen(
            selectedBusiness: settings.arguments as Isletme,
          ),
        );
      case AppRoutes.appointmentScreen:
        return MaterialPageRoute(
          builder: (_) => AppointmentScreen(
            appointmentFunction: settings.arguments as String?,
          ),
        );
      case AppRoutes.firstOpen:
        return MaterialPageRoute(builder: (_) => const FirstLoginScreen());

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
