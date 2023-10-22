import 'package:get/get.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/recive_order_getx/recive_order_controller.dart';
import 'package:warehouse_project/injection_container.dart';

class ReciveOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReciveOrderController(getMyOrderUseCase: sl()));
  }
}
