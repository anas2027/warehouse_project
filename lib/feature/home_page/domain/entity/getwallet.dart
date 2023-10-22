import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  int funds;
  Wallet({required this.funds});

  @override
  List<Object?> get props => [funds];
}
