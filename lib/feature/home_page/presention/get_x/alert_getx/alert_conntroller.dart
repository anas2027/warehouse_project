import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/med_exp.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_med_exp_usecase.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_med_quantity_exp_qunatity.dart';

import '../../../../../error/failure.dart';

class AlertConrtoller extends GetxController {
  MedExpUseCase medExpUseCase;
  MedQuantityExpUseCase medQuantityExpUseCase;
  AlertConrtoller(
      {required this.medExpUseCase, required this.medQuantityExpUseCase});

  bool isloading = false;
  List<MedExp> medabouttoExpiredList = [];
  Future getMedpharamcyExpired() async {
    List<MedExp> refrech = [];
    medabouttoExpiredList = refrech;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var warehouseId = sharedPreferences.getString('id');
    var response = await medExpUseCase(warehouseId: '$warehouseId');
    response.fold((l) => Failure, (r) => medabouttoExpiredList.addAll(r));
    isloading = true;
    update();
  }

  List<MedExp> medabouttoQuantityExpiredList = [];

  Future getMedpharamcyQuantityExpired() async {
    List<MedExp> refrech = [];
    medabouttoQuantityExpiredList = refrech;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var warehouseId = sharedPreferences.getString('id');
    var response = await medExpUseCase(warehouseId: '$warehouseId');
    response.fold(
        (l) => Failure, (r) => medabouttoQuantityExpiredList.addAll(r));
    isloading = true;
    update();
  }

  @override
  onInit() {
    super.onInit();
    getMedpharamcyExpired();
  }

  int currentIndex = 0;

  bodyChange({required int value}) {
    currentIndex = value;
    value == 0 ? getMedpharamcyExpired() : getMedpharamcyQuantityExpired();
    update();
  }
}
