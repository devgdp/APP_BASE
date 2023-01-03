import 'package:get/get.dart';
import 'package:post/src/features/auth/data/login_repository_impl.dart';
import 'package:post/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:post/src/core/utils/dio_helper.dart';
import '../controllers/login_controller.dart';

class LoginBiding implements Bindings {
  @override
  void dependencies() {
    final LoginUseCase loginUseCase =
        LoginUseCase(LoginRepositoryImpl(Get.find<CustomDio>()));
    Get.put<LoginController>(LoginController(loginUseCase));
  }
}
