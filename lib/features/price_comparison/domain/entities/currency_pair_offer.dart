import 'package:equatable/equatable.dart';

class CurrencyPairOffer extends Equatable {
  final String baseCurrencyId;
  final String targetCurrencyId;
  final double price;
  final double quantity;
  const CurrencyPairOffer({required this.baseCurrencyId, required this.price, required this.quantity, required this.targetCurrencyId});

  @override
  List<Object?> get props => [baseCurrencyId, targetCurrencyId, price, quantity];
}
