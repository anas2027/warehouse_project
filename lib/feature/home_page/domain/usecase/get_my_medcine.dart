import 'package:dartz/dartz.dart';

import '../../../../error/failure.dart';
import '../entity/Medcine.dart';
import '../repositry/home_repositry.dart';

class GetMyMedcineUseCase {
  HomeRepositry homeRepositry;
  GetMyMedcineUseCase({required this.homeRepositry});
  Future<Either<Failure, List<Medcine>>> call() async {
    return await homeRepositry.getMyMedcine();
  }
}
