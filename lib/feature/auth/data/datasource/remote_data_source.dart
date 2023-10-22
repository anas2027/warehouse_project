import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../error/exception.dart';
import '../model/login_data_model.dart';

abstract class AuthRemoteDataSorce {
  Future<Unit> login(LoginModel loginModel);
}

const baseusrl = 'http://10.0.2.2:8000/api/houselogin';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSorce {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});
  @override
  Future<Unit> login(LoginModel loginModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final body = {'email': loginModel.email, 'password': loginModel.password};

    final response = await client.post(Uri.parse(baseusrl), body: body);
    if (response.statusCode == 200) {
      final responsejson = jsonDecode(response.body);
      await sharedPreferences.setString(
          'id', '${responsejson['warehouse']['id']}');
      await sharedPreferences.setString(
          'warehousename', '${responsejson['warehouse']['name']}');

      await sharedPreferences.setStringList('warehouse', [
        '${responsejson['warehouse']['id']}',
        '${responsejson['warehouse']['name_warehouse']}',
        '${responsejson['warehouse']['email']}',
        '${responsejson['warehouse']['city_warehouse']}',
        '${responsejson['warehouse']['street_warehouse']}',
        '${responsejson['warehouse']['phone_warehouse']}',
      ]);

      Get.showSnackbar(
        const GetSnackBar(
          message: 'login sucssuflly',
          duration: Duration(seconds: 3),
        ),
      );

      Get.offAndToNamed('/homePage');

      return Future.value(unit);
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: 'email or password is incorrct ',
          duration: Duration(seconds: 3),
        ),
      );
      throw ServerException();
    }
  }
}
