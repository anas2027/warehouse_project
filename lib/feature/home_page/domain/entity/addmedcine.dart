import 'package:equatable/equatable.dart';

class AddMedcine extends Equatable {
  String name,
      descrption,
      image,
      mg,
      exp,
      pricePharmcy,
      priceCustomer,
      composition,
      quantity,
      warehouseid,
      categoryid,
      status;

  AddMedcine(
      {required this.name,
      required this.descrption,
      required this.image,
      required this.mg,
      required this.exp,
      required this.pricePharmcy,
      required this.priceCustomer,
      required this.composition,
      required this.quantity,
      required this.warehouseid,
      required this.categoryid,
      required this.status});

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        descrption,
        image,
        mg,
        exp,
        pricePharmcy,
        priceCustomer,
        composition,
        quantity,
        warehouseid,
        categoryid,
        status
      ];
}
