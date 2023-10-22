import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class LoginResponeModel extends Equatable {
  String? warehouse;
  String? token;
  LoginResponeModel({required this.warehouse, required this.token});

  @override
  List<Object?> get props => [warehouse, token];
}

// ignore: camel_case_types
class warehouse extends Equatable {
  final int id, phone;
  final String name, email, city, street;

  // ignore: prefer_const_constructors_in_immutables
  warehouse(
      {required this.id,
      required this.phone,
      required this.name,
      required this.email,
      required this.city,
      required this.street});

  @override
  // TODO: implement props
  List<Object?> get props => [id, phone, name, email, city, street];
}
