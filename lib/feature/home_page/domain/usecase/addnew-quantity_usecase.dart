import 'package:dartz/dartz.dart';
import 'package:warehouse_project/error/failure.dart';
import 'package:warehouse_project/feature/home_page/domain/repositry/home_repositry.dart';

class AddNewQuantityMedcineUsecase {
  HomeRepositry homeRepositry;
  AddNewQuantityMedcineUsecase({required this.homeRepositry});
  Future<Either<Failure, Unit>> call(
      {required String newQuannntity, required String medId}) async {
    return await homeRepositry.addNewQuantity(
        newQuannntity: newQuannntity, MedId: medId);
  }
}
