import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/error/failure.dart';
import 'package:warehouse_project/feature/home_page/domain/repositry/home_repositry.dart';

class AddCompositionUseCase {
  HomeRepositry homeRepositry;
  AddCompositionUseCase({required this.homeRepositry});
  Future<Either<Failure, Unit>> call(
      {required String medId, required String name}) async {
    return await homeRepositry.addcomposition(
        medId: medId, namecomposition: name);
  }
}
