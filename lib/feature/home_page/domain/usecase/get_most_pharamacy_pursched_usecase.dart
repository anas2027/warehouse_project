import 'package:dartz/dartz.dart';
import 'package:warehouse_project/error/failure.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/dashboard/most_pharamacy_pursched.dart';
import 'package:warehouse_project/feature/home_page/domain/repositry/home_repositry.dart';

class MostPharamacyPurshecdUseCase {
  HomeRepositry homeRepositry;
  MostPharamacyPurshecdUseCase({required this.homeRepositry});
  Future<Either<Failure, List<MostPharamacyPurshud>>> call(
      {required String warehouseId}) async {
    return await homeRepositry.getMostPharamacyPurshud(
        warehouseId: warehouseId);
  }
}
