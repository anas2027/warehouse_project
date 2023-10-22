import 'package:get/get.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/alert_getx/alert_conntroller.dart';
import 'package:warehouse_project/injection_container.dart';

class AlertBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AlertConrtoller(medExpUseCase: sl(), medQuantityExpUseCase: sl()));
  }
}
