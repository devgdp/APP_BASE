// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:post/src/config/routes/app_routes.dart';
import 'package:post/src/features/app/domain/entities/user_app.dart';
import 'package:post/src/features/app/presentations/controllers/app_controllers.dart';
import 'package:post/src/features/auth/domain/entities/login_params.dart';
import 'package:post/src/features/auth/domain/usecases/login_usecase.dart';

import '../../../../core/utils/dio_helper.dart';

class LoginController extends GetxController {
  final AppController appController = Get.find();
  GlobalKey<FormState> loginForm =
      GlobalKey<FormState>(debugLabel: 'loginForm');
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GetStorage box = GetStorage();

  final LoginUseCase loginUseCase;

  // !Variáveis
  final _saveLogin = false.obs;

  LoginController(this.loginUseCase);
  get saveLogin => _saveLogin.value;
  set saveLogin(value) => _saveLogin.value = value;

  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  String? validateEmail(String value) {
    if (value == null || value.isEmpty || !value.isEmail) {
      return 'Informe um e-mail valido';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 5) {
      return 'Digite uma senha valida';
    }
    return null;
  }

  void setDioToken(String token) {
    Get.find<CustomDio>().updateToken(token);
  }

  void saveAccount(String token) {
    box.write('token', token);
  }

  void setUser(UserApp user) {
    appController.loggedUser = user;
  }

  Future<void> login() async {
    final LoginParams params = LoginParams(
        identifier: emailController.text, password: passwordController.text);
    final login = await loginUseCase.execute(params);
    login.fold((l) => log(l.message.toString()), (r) {
      setDioToken(r.jwt.toString());
      setUser(r);
      box.write('token', r.jwt);
      Get.offAllNamed(AppRoutes.APP);
    });
  }

  Future<void> loading() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(AppRoutes.LOGIN);
    });
  }
}
