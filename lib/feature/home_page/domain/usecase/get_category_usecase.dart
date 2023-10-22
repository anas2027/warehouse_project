import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:warehouse_project/error/failure.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/category.dart';
import 'package:warehouse_project/feature/home_page/domain/repositry/home_repositry.dart';

class GetCategoryUseCase {
  HomeRepositry homeRepositry;
  GetCategoryUseCase({required this.homeRepositry});
  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await homeRepositry.getCategoryList();
  }
}
