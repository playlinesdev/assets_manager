import 'package:asset_arbitrage/core/operation_type_enum.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_entity.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency_entity.dart';
import 'package:equatable/equatable.dart';

class AssetOfferEntity extends Equatable {
  final AssetEntity asset;
  final OperationTypeEnum operation;
  final double price;
  final double quantity;
  final CurrencyEntity currency;

  const AssetOfferEntity({required this.asset, required this.operation, required this.price, required this.quantity, required this.currency});

  @override
  List<Object?> get props => [asset, operation, price, quantity, currency];
}
