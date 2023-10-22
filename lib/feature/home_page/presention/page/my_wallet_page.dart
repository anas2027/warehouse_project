import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/core/colors/colors.dart';
import 'package:warehouse_project/core/constant/constants.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/my_wallet_getx/my_wallet_controller.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class MyWallet extends StatelessWidget {
  var wallet = Get.arguments;
  late MyColors colors = MyColors();
  MyWalletController walletController = Get.find();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.appbar,
        centerTitle: true,
        title: Text(
          'My Wallet ',
          style: TextStyle(color: colors.textcolors),
        ),
      ),
      body: GetBuilder<MyWalletController>(builder: (controller) {
        if (controller.wallet.isNotEmpty) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Image(
                image: AssetImage('assests/image/wallet.png'),
                height: size.height * 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35),
              child: TextDefault(
                  maxLine: 1,
                  colorText: colors.textcolors,
                  fontWeight: FontWeight.bold,
                  fontsize: 30,
                  textOverflow: TextOverflow.visible,
                  contentText:
                      'Your Balance Is : ${walletController.wallet[0].funds}'),
            ),
          ]);
        } else {
          return controller.isloading
              ? Center(
                  child: CircularProgressIndicator(
                  color: colors.textcolors,
                ))
              : Center(
                  child: TextDefault(
                    colorText: colors.textcolors,
                    contentText: 'your balance is 0 :(',
                    fontWeight: FontWeight.bold,
                    fontsize: 40,
                    maxLine: 1,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                );
        }
      }),
    );
  }
}
