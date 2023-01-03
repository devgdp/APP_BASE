import 'package:get/get.dart';
import 'package:post/src/features/cadastro/presentations/controllers/register_controller.dart';

class CadastroBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
