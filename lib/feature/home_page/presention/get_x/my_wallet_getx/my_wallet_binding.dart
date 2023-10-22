import 'package:get/get.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/my_wallet_getx/my_wallet_controller.dart';
import 'package:warehouse_project/injection_container.dart';

class MyWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyWalletController(getWalletUseCase: sl()));
  }
}
