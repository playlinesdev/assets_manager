import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_price.dart';

abstract class IAssetPriceRepository {
  AssetPrice getPriceInCurrency({required String currencyId, required String assetId});
  AssetPrice getPriceInCurrencyForQuantity({required String currencyId, required String assetId, required double quantity});
  List<AssetPrice> getPriceInCurrencies({required List<String> currencies, required String assetId});
  List<AssetPrice> getPriceInCurrenciesForQuantity({required List<String> currencies, required String assetId, required double quantity});
}
