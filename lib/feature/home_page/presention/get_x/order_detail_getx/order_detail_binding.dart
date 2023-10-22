import 'package:get/get.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/order_detail_getx/order_detail_controller.dart';
import 'package:warehouse_project/injection_container.dart';

class OrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderDetailController(getOrderDetailUseCase: sl()));
  }
}
