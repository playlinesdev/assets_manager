import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_price.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_price_repository.dart';

abstract class IAssetPriceReader {
  AssetPrice getPriceInCurrency({required String currencyId, required String assetId});
  AssetPrice getPriceInCurrencyForQuantity({required String currencyId, required String assetId, required double quantity});
  List<AssetPrice> getPriceInCurrencies({required List<String> currencies, required String assetId});
  List<AssetPrice> getPriceInCurrenciesForQuantity({required List<String> currencies, required String assetId, required double quantity});
}

class AssetPriceReader implements IAssetPriceReader {
  final IAssetPriceRepository repository;
  AssetPriceReader(this.repository);

  @override
  List<AssetPrice> getPriceInCurrencies({required List<String> currencies, required String assetId}) =>
      repository.getPriceInCurrencies(currencies: currencies, assetId: assetId);

  @override
  List<AssetPrice> getPriceInCurrenciesForQuantity({required List<String> currencies, required String assetId, required double quantity}) =>
      repository.getPriceInCurrenciesForQuantity(currencies: currencies, assetId: assetId, quantity: quantity);

  @override
  AssetPrice getPriceInCurrency({required String currencyId, required String assetId}) =>
      repository.getPriceInCurrency(currencyId: currencyId, assetId: assetId);

  @override
  AssetPrice getPriceInCurrencyForQuantity({required String currencyId, required String assetId, required double quantity}) =>
      repository.getPriceInCurrencyForQuantity(currencyId: currencyId, assetId: assetId, quantity: quantity);
}
