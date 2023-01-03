import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post/src/config/themes/app_assets.dart';
import 'package:post/src/features/auth/widgets/custom_button.dart';
import 'package:post/src/features/auth/widgets/custom_text_field.dart';

import '../controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(children: const [
        CircularProgressIndicator(),
      ]),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width / 3,
            child: Image.asset(AppAssets.logo),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
            child: CustomTextField(
              controller: controller.emailController,
              hint: 'Digite seu e-mail',
              obscureText: false,
              textInputType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
            child: CustomTextField(
                controller: controller.passwordController,
                hint: 'Digite sua senha',
                obscureText: true,
                textInputType: TextInputType.text),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 15, right: 25),
            child: CustomButton(
              onPressed: () {
                controller.isLoading = true;
                showAlertDialog(context);
                controller.login();
              },
              title: 'Login',
            ),
          )
        ],
      ),
    );
  }
}
