import 'package:equatable/equatable.dart';

class Medcine extends Equatable {
  final String name, imageUrl, description, name_category;
  final int quantity, mg, price_customer, pharmcyPrice, id, status;

  final String exp;
  const Medcine(
      {required this.id,
      required this.description,
      required this.imageUrl,
      required this.pharmcyPrice,
      required this.exp,
      required this.mg,
      required this.name,
      required this.price_customer,
      required this.quantity,
      required this.name_category,
      required this.status});
  @override
  List<Object?> get props => [
        id,
        name,
        description,
        exp,
        quantity,
        mg,
        price_customer,
        pharmcyPrice,
        imageUrl,
        status,
        name_category
      ];
}
