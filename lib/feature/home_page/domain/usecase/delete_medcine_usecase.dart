import 'package:dartz/dartz.dart';
import 'package:warehouse_project/error/failure.dart';
import 'package:warehouse_project/feature/home_page/domain/repositry/home_repositry.dart';

class DeleteMecineUseCase {
  HomeRepositry homeRepositry;
  DeleteMecineUseCase({required this.homeRepositry});
  Future<Either<Failure, Unit>> call({required String medId}) async {
    return await homeRepositry.deleteMedcien(medId);
  }
}
