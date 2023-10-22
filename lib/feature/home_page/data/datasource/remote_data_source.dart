import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warehouse_project/error/exception.dart';
import 'package:warehouse_project/feature/home_page/data/model/add_medcine_data_model.dart';
import 'package:warehouse_project/feature/home_page/data/model/category_data_model.dart';
import 'package:warehouse_project/feature/home_page/data/model/get_walet_data_model.dart';
import 'package:warehouse_project/feature/home_page/data/model/med_exp_model.dart';
import 'package:warehouse_project/feature/home_page/data/model/order_detail_model.dart';
import 'package:warehouse_project/feature/home_page/data/model/order_recive_model.dart';

import '../model/mostwarehouse_purcehed_model.dart';
import '../model/my_medcine_data_model.dart';

abstract class HomeRemoteDataSorce {
  Future<List<MyMedcineModel>> getMyMed();
  Future<Unit> addMedcine(AddMedcineDataModel addMedcineDataModel);
  Future<Unit> editMedcine(MyMedcineModel medcineModel);
  Future<Unit> deleteMedcine(String medId);
  Future<List<WalletDataModel>> getMyWallet();
  Future<List<CategoryModel>> getCategoryList();
  Future<Unit> minusnewQuantiytMedcine(
      {required String newQuannntity, required String MedId});
  Future<Unit> sumnewQuantiytMedcine(
      {required String newQuannntity, required String MedId});
  Future<Unit> addcomposition(
      {required String medId, required String namecomposition});
  Future<List<OrderReciveModel>> getMyOrder({required String warehouseId});
  Future<List<OrderDetailModel>> getOrderDetail({required String orderId});
  Future<List<MedExpModel>> getMedExpired({required String warehouseId});
  Future<List<MedExpModel>> getQunatityExpired({required String warehouseId});
  Future<List<MostPharamacyPurshudModel>> getMostPharamacyPurshud(
      {required String warehouseId});
}

const baseusrl = 'http://10.0.2.2:8000/api/med';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSorce {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<Unit> addMedcine(AddMedcineDataModel addMedcineDataModel) async {
    String uri = 'http://10.0.2.2:8000/api/addmed';
    final body = {
      'name_med': addMedcineDataModel.name,
      'descrption': addMedcineDataModel.descrption,
      'image': addMedcineDataModel.image,
      'mg': addMedcineDataModel.mg,
      'exp': addMedcineDataModel.exp,
      'price_pharmacy': addMedcineDataModel.pricePharmcy,
      'price_customer': addMedcineDataModel.priceCustomer,
      'composition': addMedcineDataModel.composition,
      'quantity': addMedcineDataModel.quantity,
      'warehouse_id': addMedcineDataModel.warehouseid,
      'category_id': addMedcineDataModel.categoryid,
      'status': addMedcineDataModel.status
    };
    final response = await client.post(Uri.parse(uri), body: body);
  print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      Get.offAllNamed('/homePage');

      return Future.value(unit);
    } else {
      return throw ServerException();
    }
  }

  @override
  Future<Unit> editMedcine(MyMedcineModel medcineModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var warehouseId = sharedPreferences.getString('id');
    int wareId = int.parse(warehouseId!);
    final body = {
      'id': '${medcineModel.id}',
      'descrption': "${medcineModel.description}",
      'name_med': "${medcineModel.name}",
      'image': "${medcineModel.imageUrl}",
      'mg': "${medcineModel.mg}",
      'exp': '${medcineModel.exp}',
      'price_pharmacy': '${medcineModel.pharmcyPrice}',
      'price_customer': '${medcineModel.price_customer}',
      'quantity': '${medcineModel.quantity}',
      'warehouse_id': '$warehouseId',
      'category_id': '1',
      'status': '${medcineModel.status}'
    };
    final response = await client.put(Uri.parse(baseusrl), body: body);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      Get.offAndToNamed('/homePage');
      return Future.value(unit);
    } else {
      return throw ServerException();
    }
  }

  @override
  Future<List<MyMedcineModel>> getMyMed() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var wareId = sharedPreferences.getString('id');
    print('dada');
    print(wareId);
    String url = 'http://10.0.2.2:8000/api/med';

    final response = await client
        .post(Uri.parse(baseusrl), body: {'warehouse_id': '$wareId'});
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<MyMedcineModel> myMedcineModels = decodeJson
          .map<MyMedcineModel>((e) => MyMedcineModel.fromJson(e))
          .toList();
      print(decodeJson);
      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteMedcine(String medId) async {
    final body = {'id': medId};
    final response = await client.delete(Uri.parse(baseusrl), body: body);

    if (response.statusCode == 200) {
      Get.showSnackbar(
        const GetSnackBar(
          message: 'your medcine is deleted ',
          duration: Duration(seconds: 3),
        ),
      );
      return Future.value(unit);
    } else {
      return throw ServerException();
    }
  }

  @override
  Future<List<WalletDataModel>> getMyWallet() async {
    var url = 'http://10.0.2.2:8000/api/walletget';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var wareId = sharedPreferences.getString('id');
    final body = {'id': '$wareId'};
    print(body);
    final response = await client.post(Uri.parse(url), body: body);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<WalletDataModel> walletModels = decodeJson
          .map<WalletDataModel>((e) => WalletDataModel.fromJson(e))
          .toList();
      return walletModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CategoryModel>> getCategoryList() async {
    var url = 'http://10.0.2.2:8000/api/Category/all';

    final response = await client.get(Uri.parse(url));
    print('dawd');
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<CategoryModel> categoryModel = decodeJson
          .map<CategoryModel>((e) => CategoryModel.fromJson(e))
          .toList();
      return categoryModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> minusnewQuantiytMedcine(
      {required String newQuannntity, required String MedId}) async {
    var url = 'http://10.0.2.2:8000/api/minusquantity';
    var body = {'quantity': newQuannntity, 'id': MedId};
    final response = await client.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      Get.showSnackbar(
        const GetSnackBar(
          message:
              'your medcine is updated sucssuflly swip sown if the value dosnt update',
          duration: Duration(seconds: 3),
        ),
      );
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> sumnewQuantiytMedcine(
      {required String newQuannntity, required String MedId}) async {
    var url = 'http://10.0.2.2:8000/api/addquantity';
    var body = {'quantity': newQuannntity, 'id': MedId};

    final response = await client.post(Uri.parse(url), body: body);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.showSnackbar(
        const GetSnackBar(
          message:
              'your medcine is updated sucssuflly swip sown if the value dosnt update',
          duration: Duration(seconds: 3),
        ),
      );
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addcomposition(
      {required String medId, required String namecomposition}) async {
    var url = 'http://10.0.2.2:8000/api/add/composition';
    var body = {'med_id': medId, 'name': namecomposition};

    final response = await client.post(Uri.parse(url), body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Get.showSnackbar(
        const GetSnackBar(
          message: 'your medcine is updated sucssuflly',
          duration: Duration(seconds: 3),
        ),
      );
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<OrderReciveModel>> getMyOrder(
      {required String warehouseId}) async {
    var url = 'http://10.0.2.2:8000/api/order';
    var body = {
      'id': warehouseId,
    };

    final response = await client.post(Uri.parse(url), body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<OrderReciveModel> myMedcineModels = decodeJson
          .map<OrderReciveModel>((e) => OrderReciveModel.fromJson(e))
          .toList();
      Get.showSnackbar(
        const GetSnackBar(
          message: 'your medcine is updated sucssuflly',
          duration: Duration(seconds: 3),
        ),
      );
      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<OrderDetailModel>> getOrderDetail(
      {required String orderId}) async {
    var url = 'http://10.0.2.2:8000/api/getorder/details';
    var body = {
      'id': orderId,
    };
    final response = await client.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<OrderDetailModel> myMedcineModels = decodeJson
          .map<OrderDetailModel>((e) => OrderDetailModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MedExpModel>> getMedExpired({required String warehouseId}) async {
    var url = 'http://10.0.2.2:8000/api/exp?id=$warehouseId';

    final response = await client.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<MedExpModel> myMedcineModels =
          decodeJson.map<MedExpModel>((e) => MedExpModel.fromJson(e)).toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MedExpModel>> getQunatityExpired(
      {required String warehouseId}) async {
    var url = 'http://10.0.2.2:8000/api/notification?id=$warehouseId';

    final response = await client.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<MedExpModel> myMedcineModels =
          decodeJson.map<MedExpModel>((e) => MedExpModel.fromJson(e)).toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MostPharamacyPurshudModel>> getMostPharamacyPurshud(
      {required String warehouseId}) async {
    var url = 'http://10.0.2.2:8000/api/customer';
    var body = {'id': warehouseId};
    final response = await client.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<MostPharamacyPurshudModel> myMedcineModels = decodeJson
          .map<MostPharamacyPurshudModel>(
              (e) => MostPharamacyPurshudModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }
}
