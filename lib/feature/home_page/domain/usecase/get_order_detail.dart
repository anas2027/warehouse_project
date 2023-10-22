import 'package:dartz/dartz.dart';
import 'package:warehouse_project/error/failure.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/order_details.dart';
import 'package:warehouse_project/feature/home_page/domain/repositry/home_repositry.dart';

class GetOrderDetailUseCase {
  HomeRepositry homeRepositry;
  GetOrderDetailUseCase({required this.homeRepositry});
  Future<Either<Failure, List<OrderDetails>>> call(
      {required String orderId}) async {
    return await homeRepositry.getOrderDetail(orderId: orderId);
  }
}
