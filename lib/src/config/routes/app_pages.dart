import 'package:get/get.dart';
import '../../core/features/app/presentations/pages/app_page.dart';

import '../../config/routes/app_routes.dart';
import '../../core/features/auth/presentations/bindings/login_bidings.dart';
import '../../core/features/auth/presentations/pages/splash_page.dart';
import '../../core/features/auth/presentations/pages/login_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: LoginBiding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBiding(),
    ),
    GetPage(
      name: AppRoutes.APP,
      page: () => AppPage(),
      binding: LoginBiding(),
    ),
  ];
}
