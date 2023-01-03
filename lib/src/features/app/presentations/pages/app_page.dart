// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:post/src/config/themes/app_assets.dart';
import 'package:post/src/features/app/presentations/controllers/app_controllers.dart';
import 'package:post/src/features/app/widgets/app_bottom_navigator.dart';

class AppPage extends GetView<AppController> {
  AppPage({super.key});

  final PageController pageController =
      PageController(initialPage: Get.arguments?['page'] ?? 0);
  final GlobalKey bottomNavigator = GlobalKey();
  final GlobalKey pageView = GlobalKey();
  ValueNotifier<int> currentPage = ValueNotifier(Get.arguments?['page'] ?? 0);

  List<Map<String, dynamic>> bottomNavItems = [
    {'icon': AppAssets.iconHome, 'label': 'Home'},
    {'icon': AppAssets.iconPersonAdd, 'label': 'Cadastro'},
    {'icon': AppAssets.iconQrCode, 'label': 'Produtos'},
    {'icon': AppAssets.iconCarRepair, 'label': 'Carros'},
    {'icon': AppAssets.iconShoppingCart, 'label': 'OS'},
  ];

  List<Widget> pages = [
    const Text('Home'),
    const Text('Cadastro'),
    const Text('Produtos'),
    const Text('Carros'),
    const Text('OS'),
  ];

  @override
  Widget build(BuildContext context) {
    pageController.addListener(
        (() => currentPage.value = pageController.page?.toInt() ?? 0));
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: currentPage,
          builder: ((context, value, child) => AppBottomNavigator(
              pageController: pageController,
              bottomNavItems: bottomNavItems,
              currentPage: value,
              onTap: (i) => pageController.animateToPage(i,
                  duration: const Duration(microseconds: 300),
                  curve: Curves.ease))),
        ),
        body: PageView(
          key: pageView,
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: pages,
        ),
      ),
    );
  }
}
