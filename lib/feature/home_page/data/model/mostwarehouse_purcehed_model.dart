import 'package:warehouse_project/feature/home_page/domain/entity/dashboard/most_pharamacy_pursched.dart';

class MostPharamacyPurshudModel extends MostPharamacyPurshud {
  MostPharamacyPurshudModel(
      {required super.id,
      required super.name,
      required super.name_ph,
      required super.email,
      required super.city,
      required super.street,
      required super.phone});

  factory MostPharamacyPurshudModel.fromJson(Map<String, dynamic> json) {
    return MostPharamacyPurshudModel(
      id: json['id'],
      name: json['name'],
      name_ph: json['name_ph'],
      email: json['email'],
      city: json['city'],
      street: json['street'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'name_ph': name_ph,
      'email': email,
      'city': city,
      'street': street,
      'phone': phone,
    };
  }
}
