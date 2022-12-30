import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../domain/entities/user_app.dart';

class AppController extends GetxController {
  final PageController pageController = PageController();

  final _loggedUser = UserApp().obs;
  UserApp get loggedUser => _loggedUser.value;
  set loggedUser(UserApp value) => _loggedUser.value = value;

  final _currentPage = 0.obs;
  int get currentPage => _currentPage.value;
  set currentPage(int value) => _currentPage.value = value;

  void animateToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
  }
}
