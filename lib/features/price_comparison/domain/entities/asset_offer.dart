import 'package:asset_arbitrage/core/operation_type.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency.dart';
import 'package:equatable/equatable.dart';

class AssetOffer extends Equatable {
  final Asset asset;
  final OperationType operation;
  final double price;
  final double quantity;
  final Currency currency;

  const AssetOffer({required this.asset, required this.operation, required this.price, required this.quantity, required this.currency});

  @override
  List<Object?> get props => [asset, operation, price, quantity, currency];
}
