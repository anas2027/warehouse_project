// ignore_for_file: camel_case_types

import 'package:warehouse_project/feature/home_page/domain/entity/getwallet.dart';

// ignore: must_be_immutable
class WalletDataModel extends Wallet {
  WalletDataModel({required super.funds});
  factory WalletDataModel.fromJson(Map<String, dynamic> json) {
    return WalletDataModel(funds: json['funds']);
  }

  Map<String, dynamic> toJson() {
    return {
      'funds': funds,
    };
  }
}
