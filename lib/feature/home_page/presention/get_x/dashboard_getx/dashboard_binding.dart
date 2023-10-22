import 'package:get/get.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/dashboard_getx/dashboard_controller.dart';
import 'package:warehouse_project/injection_container.dart';

class dashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(mostPharamacyPurshecdUseCase: sl()));
  }
}
