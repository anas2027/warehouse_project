import '../../domain/entity/Medcine.dart';

class MyMedcineModel extends Medcine {
  const MyMedcineModel(
      {required super.exp,
      required super.mg,
      required super.name,
      required super.price_customer,
      required super.quantity,
      required super.imageUrl,
      required super.pharmcyPrice,
      required super.description,
      required super.id,
      required super.name_category,
      required super.status});
  factory MyMedcineModel.fromJson(Map<String, dynamic> json) {
    return MyMedcineModel(
        status: json['status'],
        name: json['name_med'],
        description: json['descrption'],
        imageUrl: json['image'],
        mg: json['mg'],
        exp: json['exp'],
        quantity: json['quantity'],
        price_customer: json['price_customer'],
        pharmcyPrice: json['price_pharmacy'],
        id: json['id'],
        name_category: json['name_category']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_med': name,
      'descrption': description,
      'exp': exp,
      'mg': mg,
      'price_customer': price_customer,
      'quantity': quantity,
      'image': imageUrl,
      'price_pharmacy': pharmcyPrice,
      'name_category': name_category,
      'status': status
    };
  }
}
