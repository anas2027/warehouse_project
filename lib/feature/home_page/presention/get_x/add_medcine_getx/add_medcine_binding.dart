import 'package:get/get.dart';
import 'package:warehouse_project/injection_container.dart';

import 'add_medcine_controller.dart';

class AddMedcineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
        AddMedcinecontoller(addmedcineUseCase: sl(), getCategoryUseCase: sl()));
  }
}
