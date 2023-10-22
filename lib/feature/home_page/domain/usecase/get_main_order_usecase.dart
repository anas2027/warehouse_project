import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/error/failure.dart';
import 'package:warehouse_project/feature/auth/domain/entity/login_response.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/order_recive.dart';
import 'package:warehouse_project/feature/home_page/domain/repositry/home_repositry.dart';

class GetMyOrderUseCase {
  HomeRepositry homeRepositry;
  GetMyOrderUseCase({required this.homeRepositry});
  Future<Either<Failure, List<OrderRecive>>> call(
      {required String WarehouseId}) async {
    return await homeRepositry.getMyOrder(warehosueId: WarehouseId);
  }
}
