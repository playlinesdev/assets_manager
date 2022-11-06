import 'package:asset_arbitrage/core/operation_type.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency.dart';
import 'package:equatable/equatable.dart';

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class AssetParams extends Equatable {
  final String name;
  final String id;

  const AssetParams({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

class AssetOfferParams extends Equatable {
  final String assetId;
  final double price;
  final OperationType operation;
  final double quantity;
  final Currency currency;

  const AssetOfferParams({required this.assetId, required this.operation, required this.price, required this.quantity, required this.currency});

  @override
  List<Object?> get props => [price, operation, quantity];
}

class AssetsFilterParams extends Equatable {
  final String? name;
  final String? id;
  const AssetsFilterParams({this.id, this.name});

  @override
  List<Object?> get props => [id, name];
}

class CurrencyFilterParams extends Equatable {
  final String? name;
  final String? symbol;
  const CurrencyFilterParams({this.name, this.symbol});
  @override
  List<Object?> get props => [];
}
