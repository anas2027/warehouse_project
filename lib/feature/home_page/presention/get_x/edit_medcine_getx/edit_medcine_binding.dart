import 'package:get/get.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/edit_medcine_getx/edit_medcine_controller.dart';
import 'package:warehouse_project/injection_container.dart';

class EditMedcineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditMedcineController(
        editMedcineUseCase: sl(), getCategoryUseCase: sl()));
    // TODO: implement dependencies
  }
}
