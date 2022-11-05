import 'package:equatable/equatable.dart';

class CurrencyEntity extends Equatable {
  final String name;
  final String symbol;

  const CurrencyEntity({required this.name, required this.symbol});

  @override
  List<Object?> get props => [name];
}
