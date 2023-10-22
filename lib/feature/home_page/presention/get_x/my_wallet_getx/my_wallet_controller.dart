import 'package:get/get.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/getwallet.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_wallet_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../../../error/failure.dart';

class MyWalletController extends GetxController {
  GetWalletUseCase getWalletUseCase;
  MyWalletController({required this.getWalletUseCase});

  final List<Wallet> wallet = [];
  @override
  onInit() async {
    super.onInit();
    await getWallet();
  }

  bool isloading = true;
  Future getWallet() async {
    // ignore: non_constant_identifier_names, unused_local_variable

    final Mywallet = await getWalletUseCase();
    Mywallet.fold((l) => Failure, (r) => wallet.addAll(r));
    isloading = false;
    update();
  }
}
