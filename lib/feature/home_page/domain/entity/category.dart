import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  // ignore: non_constant_identifier_names
  final String nameCategory;
  final int id;
  CategoryEntity({required this.nameCategory, required this.id});

  @override
  List<Object?> get props => [nameCategory];
}
