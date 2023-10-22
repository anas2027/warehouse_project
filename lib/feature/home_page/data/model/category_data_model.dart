import 'package:flutter/foundation.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/category.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({required super.nameCategory, required super.id});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(nameCategory: json['name_category'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_category': nameCategory,
    };
  }
}
