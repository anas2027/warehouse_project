import 'package:get/get.dart';

import '../../../../injection_container.dart';
import 'auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(loginUseCase: sl()));
  }
}
