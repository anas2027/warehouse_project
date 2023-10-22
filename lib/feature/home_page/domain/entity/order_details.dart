// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:equatable/equatable.dart';

class OrderDetails extends Equatable {
  int id, mg, price_pharmacy, price_customer, phone, quantity, status;
  String name_med, image, exp, descrption, name_ph, city, street;
  OrderDetails(
      {required this.id,
      required this.name_med,
      required this.image,
      required this.mg,
      required this.exp,
      required this.descrption,
      required this.price_pharmacy,
      required this.price_customer,
      required this.quantity,
      required this.status,
      required this.name_ph,
      required this.city,
      required this.street,
      required this.phone});
  @override
  List<Object?> get props => [
        id,
        name_med,
        image,
        mg,
        exp,
        descrption,
        price_pharmacy,
        price_customer,
        quantity,
        status,
        name_ph,
        city,
        street,
        phone
      ];
}
