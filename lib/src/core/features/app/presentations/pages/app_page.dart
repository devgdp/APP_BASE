import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post/main.dart';
import 'package:post/src/core/features/app/presentations/controllers/app_controllers.dart';
import 'package:post/src/core/features/app/widgets/app_bottom_navigator.dart';

class AppPage extends GetView<AppController> {
  AppPage({super.key});

  final PageController pageController =
      PageController(initialPage: Get.arguments?['page'] ?? 0);
  final GlobalKey bottomNavigator = GlobalKey();
  final GlobalKey pageView = GlobalKey();
  ValueNotifier<int> currentPage = ValueNotifier(Get.arguments?['page'] ?? 0);

  List<Map<String, dynamic>> bottomNavItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.person_add, 'label': 'Cadastro'},
    {'icon': Icons.qr_code, 'label': 'Produtos'},
    {'icon': Icons.car_rental, 'label': 'Carros'},
    {'icon': Icons.shopping_cart, 'label': 'OS'},
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
