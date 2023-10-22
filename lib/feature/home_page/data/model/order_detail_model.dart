import 'package:warehouse_project/feature/home_page/domain/entity/order_details.dart';

class OrderDetailModel extends OrderDetails {
  OrderDetailModel(
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
      required super.name_ph,
      required super.city,
      required super.street,
      required super.phone});
  factory OrderDetailModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailModel(
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
      name_ph: json['name_ph'],
      city: json['city'],
      street: json['street'],
      phone: json['phone'],
    );
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
      'name_ph': name_ph,
      'city': city,
      'street': street,
      'phone': phone
    };
  }
}
