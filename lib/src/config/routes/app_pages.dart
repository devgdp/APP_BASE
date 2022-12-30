import 'package:get/get.dart';
import '../../config/routes/app_routes.dart';
import '../../core/features/auth/presentations/bindings/login_bidings.dart';

import '../../core/features/auth/presentations/pages/splash_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: LoginBiding(),
    )
  ];
}
