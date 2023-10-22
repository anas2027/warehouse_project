import 'package:equatable/equatable.dart';

class MostPharamacyPurshud extends Equatable {
  int id, phone;
  String name, name_ph, email, city, street;
  MostPharamacyPurshud({
    required this.id,
    required this.name,
    required this.name_ph,
    required this.email,
    required this.city,
    required this.street,
    required this.phone,
  });
  @override
  List<Object?> get props => [id, name, name_ph, email, city, street, phone];
}
