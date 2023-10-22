import 'package:get/get.dart';
import 'package:warehouse_project/error/failure.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/order_details.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_order_detail.dart';

class OrderDetailController extends GetxController {
  GetOrderDetailUseCase getOrderDetailUseCase;
  OrderDetailController({required this.getOrderDetailUseCase});
  var resposne = Get.parameters;
  @override
  onInit() {
    super.onInit();
    var id = '${resposne['orderId']}';

    print(id);
    getOrderDetail(orderID: '$id');
  }

  bool isloading = false;
  List<OrderDetails> orderDetail = [];
  Future getOrderDetail({required String orderID}) async {
    var response = await getOrderDetailUseCase(orderId: '$orderID');
    response.fold((l) => Failure, (r) {
      orderDetail.addAll(r);
      isloading = true;
    });
    isloading = true;

    update();
  }
}
