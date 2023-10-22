import 'package:warehouse_project/feature/home_page/domain/entity/order_recive.dart';

class OrderReciveModel extends OrderRecive {
  OrderReciveModel(
      {required super.id,
      required super.id_ph,
      required super.name_ph,
      required super.city,
      required super.street,
      required super.phone,
      required super.status,
      required super.status_user,
      required super.total_price});
  factory OrderReciveModel.fromJson(Map<String, dynamic> json) {
    return OrderReciveModel(
        id: json['id'],
        id_ph: json['id_ph'],
        name_ph: json['name_ph'],
        city: json['city'],
        street: json['street'],
        phone: json['phone'],
        status: json['status'],
        status_user: json['status_user'],
        total_price: json['total_price']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_ph': id_ph,
      'name_ph': name_ph,
      'city': city,
      'street': street,
      'phone': phone,
      'status': status,
      'status_user': status_user,
      'total_price': total_price
    };
  }
}
