import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/addmedcine.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/category.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/dashboard/most_pharamacy_pursched.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/getwallet.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/med_exp.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/order_details.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/order_recive.dart';

import '../../../../error/failure.dart';
import '../entity/Medcine.dart';

abstract class HomeRepositry {
  Future<Either<Failure, List<Medcine>>> getMyMedcine();
  Future<Either<Failure, Unit>> addMedcine(AddMedcine medcine);
  Future<Either<Failure, Unit>> editMedcine(Medcine medcine);
  Future<Either<Failure, Unit>> deleteMedcien(String medId);
  Future<Either<Failure, List<Wallet>>> getWawlletvalue();
  Future<Either<Failure, List<CategoryEntity>>> getCategoryList();
  Future<Either<Failure, Unit>> addNewQuantity(
      {required String newQuannntity, required String MedId});
  Future<Either<Failure, Unit>> minusQunatity(
      {required String newQuannntity, required String MedId});
  Future<Either<Failure, Unit>> addcomposition(
      {required String medId, required String namecomposition});
  Future<Either<Failure, List<OrderRecive>>> getMyOrder(
      {required String warehosueId});
  Future<Either<Failure, List<OrderDetails>>> getOrderDetail(
      {required String orderId});
  Future<Either<Failure, List<MedExp>>> getmedExp(
      {required String warehouseId});
  Future<Either<Failure, List<MedExp>>> getmedquantityExp(
      {required String warehouseId});

  Future<Either<Failure, List<MostPharamacyPurshud>>> getMostPharamacyPurshud(
      {required String warehouseId});
}
