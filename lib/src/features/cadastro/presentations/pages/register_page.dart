// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post/src/features/auth/widgets/custom_button.dart';
import 'package:post/src/features/auth/widgets/custom_text_field.dart';
import 'package:post/src/features/cadastro/presentations/controllers/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text('Cadastrar Usuario'),
                    ),
                    const SizedBox(height: 10),
                    const CustomTextField(
                      obscureText: false,
                      textInputType: TextInputType.text,
                      hint: 'Nome de Usuario',
                    ),
                    const SizedBox(height: 10),
                    const CustomTextField(
                      obscureText: false,
                      textInputType: TextInputType.emailAddress,
                      hint: 'E-mail',
                    ),
                    const SizedBox(height: 10),
                    const CustomTextField(
                      obscureText: true,
                      textInputType: TextInputType.text,
                      hint: 'Senha',
                    ),
                    const SizedBox(height: 10),
                    const CustomTextField(
                      obscureText: false,
                      textInputType: TextInputType.phone,
                      hint: 'Whatsapp',
                    ),
                    const SizedBox(height: 10),
                    const CustomTextField(
                      obscureText: false,
                      textInputType: TextInputType.datetime,
                      hint: 'Data de Nascimento',
                    ),
                    const SizedBox(height: 10),
                    CustomButton(onPressed: () {}, title: 'Cadastrar')
                  ],
                ))
          ],
        )),
      )),
    );
  }
}
