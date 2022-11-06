import 'package:equatable/equatable.dart';

class AssetPrice extends Equatable {
  final String assetId;
  final String currencyId;
  final double price;
  const AssetPrice({required this.assetId, required this.currencyId, required this.price});

  @override
  List<Object?> get props => [assetId, currencyId, price];
}
