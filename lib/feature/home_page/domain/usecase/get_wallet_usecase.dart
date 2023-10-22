import 'package:dartz/dartz.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/getwallet.dart';
import 'package:warehouse_project/feature/home_page/domain/repositry/home_repositry.dart';

import '../../../../error/failure.dart';

class GetWalletUseCase {
  HomeRepositry homeRepositry;
  GetWalletUseCase({required this.homeRepositry});
  Future<Either<Failure, List<Wallet>>> call() async {
    return await homeRepositry.getWawlletvalue();
  }
}
