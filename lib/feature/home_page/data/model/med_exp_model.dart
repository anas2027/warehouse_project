import 'package:warehouse_project/feature/home_page/domain/entity/med_exp.dart';

class MedExpModel extends MedExp {
  MedExpModel(
      {required super.id,
      required super.name_med,
      required super.image,
      required super.mg,
      required super.exp,
      required super.descrption,
      required super.price_pharmacy,
      required super.price_customer,
      required super.quantity,
      required super.status,
      required super.warehouse_id,
      required super.category_id});
  factory MedExpModel.fromJson(Map<String, dynamic> json) {
    return MedExpModel(
        id: json['id'],
        name_med: json['name_med'],
        image: json['image'],
        mg: json['mg'],
        exp: json['exp'],
        descrption: json['descrption'],
        price_pharmacy: json['price_pharmacy'],
        price_customer: json['price_customer'],
        quantity: json['quantity'],
        status: json['status'],
        warehouse_id: json['warehouse_id'],
        category_id: json['category_id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_med': name_med,
      'image': image,
      'mg': mg,
      'exp': exp,
      'descrption': descrption,
      'price_pharmacy': price_pharmacy,
      'price_customer': price_customer,
      'quantity': quantity,
      'status': status,
      'warehouse_id': warehouse_id,
      'category_id': category_id
    };
  }
}
