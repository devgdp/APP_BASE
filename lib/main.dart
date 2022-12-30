import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post/src/config/routes/app_routes.dart';
import '/src/config/routes/app_pages.dart';
import '/src/core/features/app/presentations/bindings/app_bindings.dart';

import 'src/core/helpers/app_helper.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorObservers: [AppHelper.routerObserver],
      debugShowCheckedModeBanner: false,
      title: 'Veículos',
      getPages: AppPages.pages,
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.SPLASH,
    );
  }
}
