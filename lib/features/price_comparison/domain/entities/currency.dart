import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String name;
  final String symbol;

  const Currency({required this.name, required this.symbol});

  @override
  List<Object?> get props => [name];
}
