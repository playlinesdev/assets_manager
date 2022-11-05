import 'package:asset_arbitrage/core/operation_type_enum.dart';
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
  final OperationTypeEnum operation;
  final double quantity;

  const AssetOfferParams({required this.assetId, required this.operation, required this.price, required this.quantity});

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
