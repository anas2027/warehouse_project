import 'package:warehouse_project/feature/home_page/domain/entity/addmedcine.dart';

class AddMedcineDataModel extends AddMedcine {
  AddMedcineDataModel(
      {required super.name,
      required super.descrption,
      required super.image,
      required super.mg,
      required super.exp,
      required super.pricePharmcy,
      required super.priceCustomer,
      required super.composition,
      required super.quantity,
      required super.warehouseid,
      required super.categoryid,
      required super.status});
  factory AddMedcineDataModel.fromJson(Map<String, dynamic> json) {
    return AddMedcineDataModel(
      name: json['name_med'],
      descrption: json['descrption'],
      image: json['image'],
      mg: json['mg'],
      exp: json['exp'],
      pricePharmcy: json['price_pharmacy'],
      priceCustomer: json['priceCustomer'],
      composition: json['composition'],
      quantity: json['quantity'],
      warehouseid: json['warehouse_id'],
      categoryid: json['category_id'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name_med': name,
      'descrption': descrption,
      'image': image,
      'mg': mg,
      'exp': exp,
      'price_pharmacy': pricePharmcy,
      'price_customer': priceCustomer,
      'composition': composition,
      'quantity': quantity,
      'warehouse_id': warehouseid,
      'category_id': categoryid,
      'status': status
    };
  }
}
