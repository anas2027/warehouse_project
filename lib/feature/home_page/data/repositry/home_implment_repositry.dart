import 'package:dartz/dartz.dart';
import 'package:flutter/src/foundation/annotations.dart';
import 'package:warehouse_project/error/exception.dart';
import 'package:warehouse_project/feature/home_page/data/model/add_medcine_data_model.dart';
import 'package:warehouse_project/feature/home_page/data/model/get_walet_data_model.dart';
import 'package:warehouse_project/feature/home_page/data/model/my_medcine_data_model.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/addmedcine.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/category.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/dashboard/most_pharamacy_pursched.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/getwallet.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/med_exp.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/order_details.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/order_recive.dart';

import '../../../../error/failure.dart';
import '../../../../error/network/network_info.dart';
import '../../domain/entity/Medcine.dart';
import '../../domain/repositry/home_repositry.dart';
import '../datasource/remote_data_source.dart';

class HomeRepositryImp implements HomeRepositry {
  final NetworkInfo networkInfo;
  final HomeRemoteDataSorce homeRemoteDataSource;
  HomeRepositryImp(
      {required this.homeRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Medcine>>> getMyMedcine() async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.getMyMed();
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.getMyMed();
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  Future<Either<Failure, Unit>> responeState(
      Future<Unit> Function() editMedcine) async {
    if (await networkInfo.isconnected) {
      try {
        await editMedcine;
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> editMedcine(Medcine medcine) async {
    final MyMedcineModel medcineModel = MyMedcineModel(
        id: medcine.id,
        description: medcine.description,
        exp: medcine.exp,
        mg: medcine.mg,
        name: medcine.name,
        price_customer: medcine.price_customer,
        quantity: medcine.quantity,
        imageUrl: medcine.imageUrl,
        pharmcyPrice: medcine.pharmcyPrice,
        name_category: medcine.name_category,
        status: medcine.status);
    if (await networkInfo.isconnected) {
      try {
        final response = await homeRemoteDataSource.editMedcine(medcineModel);
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteMedcien(String medId) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.deleteMedcine(medId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.deleteMedcine(medId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addMedcine(AddMedcine medcine) async {
    final AddMedcineDataModel medcineModel = AddMedcineDataModel(
        name: medcine.name,
        descrption: medcine.descrption,
        image: medcine.image,
        mg: medcine.mg,
        exp: medcine.exp,
        pricePharmcy: medcine.pricePharmcy,
        priceCustomer: medcine.priceCustomer,
        composition: medcine.composition,
        quantity: medcine.quantity,
        warehouseid: medcine.warehouseid,
        categoryid: medcine.categoryid,
        status: medcine.status);
    if (await networkInfo.isconnected) {
      try {
        final response = await homeRemoteDataSource.addMedcine(medcineModel);
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Wallet>>> getWawlletvalue() async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.getMyWallet();
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.getMyWallet();
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategoryList() async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.getCategoryList();
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.getCategoryList();
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addNewQuantity(
      {required String newQuannntity, required String MedId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.sumnewQuantiytMedcine(
            MedId: MedId, newQuannntity: newQuannntity);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.sumnewQuantiytMedcine(
            MedId: MedId, newQuannntity: newQuannntity);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> minusQunatity(
      {required String newQuannntity, required String MedId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.minusnewQuantiytMedcine(
                MedId: MedId, newQuannntity: newQuannntity);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.minusnewQuantiytMedcine(
                MedId: MedId, newQuannntity: newQuannntity);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addcomposition(
      {required String medId, required String namecomposition}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.addcomposition(
            medId: medId, namecomposition: namecomposition);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.addcomposition(
            medId: medId, namecomposition: namecomposition);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<OrderRecive>>> getMyOrder(
      {required String warehosueId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.getMyOrder(warehouseId: warehosueId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.getMyOrder(warehouseId: warehosueId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<OrderDetails>>> getOrderDetail(
      {required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.getOrderDetail(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.getOrderDetail(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MedExp>>> getmedExp(
      {required String warehouseId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.getMedExpired(warehouseId: warehouseId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.getMedExpired(warehouseId: warehouseId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MedExp>>> getmedquantityExp(
      {required String warehouseId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.getQunatityExpired(
            warehouseId: warehouseId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.getQunatityExpired(
            warehouseId: warehouseId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MostPharamacyPurshud>>> getMostPharamacyPurshud(
      {required String warehouseId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource
            .getMostPharamacyPurshud(warehouseId: warehouseId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource
            .getMostPharamacyPurshud(warehouseId: warehouseId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
