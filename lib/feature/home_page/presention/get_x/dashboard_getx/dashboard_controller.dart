import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warehouse_project/error/failure.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/dashboard/most_pharamacy_pursched.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_most_pharamacy_pursched_usecase.dart';

class DashboardController extends GetxController {
  MostPharamacyPurshecdUseCase mostPharamacyPurshecdUseCase;
  DashboardController({required this.mostPharamacyPurshecdUseCase});
  @override
  onInit() async {
    super.onInit();
    getphmostsales();
  }

  List<MostPharamacyPurshud> phmostsale = [];
  getphmostsales() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String wareId = '${sharedPreferences.getString('id')}';
    var response = await mostPharamacyPurshecdUseCase(warehouseId: wareId);
    response.fold((l) => Failure, (r) => phmostsale.addAll(r));
    update();
  }
}
