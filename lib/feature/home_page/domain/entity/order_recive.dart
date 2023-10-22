// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class OrderRecive extends Equatable {
  int id, id_ph, phone, status, status_user, total_price;
  String name_ph, city, street;

  OrderRecive(
      {required this.id,
      required this.id_ph,
      required this.name_ph,
      required this.city,
      required this.street,
      required this.phone,
      required this.status,
      required this.status_user,
      required this.total_price});
  @override
  List<Object?> get props => [
        id,
        id_ph,
        name_ph,
        city,
        street,
        phone,
        status,
        status_user,
        total_price
      ];
}
