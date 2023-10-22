import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warehouse_project/error/failure.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/order_recive.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_main_order_usecase.dart';

class ReciveOrderController extends GetxController {
  GetMyOrderUseCase getMyOrderUseCase;
  ReciveOrderController({required this.getMyOrderUseCase});
  @override
  onInit() {
    super.onInit();
    getOrder();
    isloading = true;
  }

  List<OrderRecive> myOrder = [];
  bool isloading = true;

  getOrder() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String WarehouseId = '${sharedPreferences.getString('id')}';
    var response = await getMyOrderUseCase(WarehouseId: WarehouseId);
    response.fold((l) => Failure, (r) => myOrder.addAll(r));
    bool isloading = false;

    update();
  }
}
