import 'package:get/get.dart';
import 'package:warehouse_project/injection_container.dart';

import 'home_page_controller.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController(
        deleteMecineUseCase: sl(),
        getMyMedcineUseCase: sl(),
        addNewQuantityMedcineUsecase: sl(),
        minusQuantityMedcineUseCase: sl(),
        addCompositionUseCase: sl()));
  }
}
