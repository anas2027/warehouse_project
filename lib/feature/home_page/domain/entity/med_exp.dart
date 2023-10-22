import 'package:equatable/equatable.dart';

class MedExp extends Equatable {
  int id,
      mg,
      status,
      warehouse_id,
      category_id,
      price_pharmacy,
      price_customer,
      quantity;
  String name_med, image, exp, descrption;
  MedExp(
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
      required this.warehouse_id,
      required this.category_id});
  @override
  // TODO: implement props
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
        warehouse_id,
        category_id
      ];
}
