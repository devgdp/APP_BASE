import 'package:get/get.dart';
import 'package:post/src/features/app/presentations/bindings/app_bindings.dart';
import 'package:post/src/features/cadastro/presentations/pages/register_page.dart';
import '../../features/app/presentations/pages/app_page.dart';

import '../../config/routes/app_routes.dart';
import '../../features/auth/presentations/bindings/login_bidings.dart';
import '../../features/auth/presentations/pages/splash_page.dart';
import '../../features/auth/presentations/pages/login_page.dart';
import '../../features/cadastro/presentations/bindings/register_binding.dart';

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
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => const RegisterPage(),
      bindings: [AppBinding(), CadastroBinding()],
    ),
  ];
}
