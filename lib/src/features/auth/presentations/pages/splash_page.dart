import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/themes/app_assets.dart';
import '../controllers/login_controller.dart';

class SplashPage extends GetView<LoginController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loading();
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.logoSplash)),
          ),
        ),
      ),
    );
  }
}
