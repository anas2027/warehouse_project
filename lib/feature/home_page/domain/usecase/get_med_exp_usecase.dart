import 'package:dartz/dartz.dart';
import 'package:warehouse_project/error/failure.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/med_exp.dart';
import 'package:warehouse_project/feature/home_page/domain/repositry/home_repositry.dart';

class MedExpUseCase {
  HomeRepositry homeRepositry;
  MedExpUseCase({required this.homeRepositry});
  Future<Either<Failure, List<MedExp>>> call(
      {required String warehouseId}) async {
    return await homeRepositry.getmedExp(warehouseId: warehouseId);
  }
}
