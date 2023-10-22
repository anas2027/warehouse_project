import 'package:dartz/dartz.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/Medcine.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/addmedcine.dart';
import 'package:warehouse_project/feature/home_page/domain/repositry/home_repositry.dart';

import '../../../../error/failure.dart';

class AddmedcineUseCase {
  HomeRepositry homeRepositry;
  AddmedcineUseCase({required this.homeRepositry});
  Future<Either<Failure, Unit>> call(AddMedcine medcine) async {
    return await homeRepositry.addMedcine(medcine);
  }
}
