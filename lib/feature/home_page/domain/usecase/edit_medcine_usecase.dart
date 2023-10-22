import 'package:dartz/dartz.dart';
import 'package:warehouse_project/error/failure.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/Medcine.dart';
import 'package:warehouse_project/feature/home_page/domain/repositry/home_repositry.dart';

class EditMedcineUseCase {
  HomeRepositry homeRepositry;
  EditMedcineUseCase({required this.homeRepositry});
  Future<Either<Failure, Unit>> call(Medcine medcine) async {
    return await homeRepositry.editMedcine(medcine);
  }
}
