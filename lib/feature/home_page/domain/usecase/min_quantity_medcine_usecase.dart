import 'package:dartz/dartz.dart';
import 'package:warehouse_project/error/failure.dart';
import 'package:warehouse_project/feature/home_page/domain/repositry/home_repositry.dart';

class MinusQuantityMedcineUseCase {
  HomeRepositry homeRepositry;
  MinusQuantityMedcineUseCase({required this.homeRepositry});
  Future<Either<Failure, Unit>> call(
      {required String newQuannntity, required String medId}) async {
    return await homeRepositry.minusQunatity(
        newQuannntity: newQuannntity, MedId: medId);
  }
}
