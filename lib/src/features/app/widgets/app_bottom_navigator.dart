import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/themes/app_colors.dart';
import 'bottom_nav_item.dart';

class AppBottomNavigator extends StatelessWidget {
  const AppBottomNavigator(
      {super.key,
      required this.pageController,
      required this.bottomNavItems,
      required this.currentPage,
      required this.onTap});

  final PageController pageController;
  final List<Map<String, dynamic>> bottomNavItems;
  final int currentPage;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.end,
          spacing: 8,
          alignment: WrapAlignment.spaceAround,
          children: bottomNavItems.map((item) {
            int index = bottomNavItems.indexOf(item);
            return InkWell(
              onTap: () => onTap(index),
              child: BottomNavItem(
                label: item['label'],
                checked: (currentPage == index),
                icon: item['icon'],
              ),
            );
          }).toList(),
        ),
      )),
    );
  }
}
