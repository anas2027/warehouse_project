class LoginResponseModel {
  Warehouse warehouse;
  String token;

  LoginResponseModel({
    required this.warehouse,
    required this.token,
  });
}

class Warehouse {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String city;
  String street;
  int phone;
  DateTime createdAt;
  DateTime updatedAt;

  Warehouse({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.city,
    required this.street,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });
}
