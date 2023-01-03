import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find();

  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: 'formKey');

  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();
  final TextEditingController controllerWhatsapp = TextEditingController();
  final TextEditingController controllerDataNascimento =
      TextEditingController();
}
