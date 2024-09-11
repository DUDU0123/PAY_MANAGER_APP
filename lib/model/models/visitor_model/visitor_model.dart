import 'package:equatable/equatable.dart';

class Visitor extends Equatable {
  final String? name;
  final double? amount;
 const Visitor({
    this.name,
    this.amount,
  });


  @override
  List<Object?> get props => [name, amount];
}
