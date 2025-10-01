import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_randevu/core/enums/app/app_local_storage.dart';
import 'package:my_randevu/core/enums/assets/app_images.dart';
import 'package:my_randevu/core/routes/app_routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'views/splash_view_body.dart';
part 'extensions/check_connection.dart';
part 'extensions/dontenvLoader.dart';
part 'widgets/image.dart';
part 'widgets/circularProgressIndicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const _SplashViewBody());
  }
}
