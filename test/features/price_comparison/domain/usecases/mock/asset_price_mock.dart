import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_price.dart';

class AssetPriceMock {
  static String currency1 = '1';
  static String currency2 = '2';
  static String currency3 = '3';
  static List<String> currencies1 = [currency1, currency2];
  static List<String> currencies2 = [currency1, currency2, currency3];
  static AssetPrice assetPrice1 = const AssetPrice(assetId: '1', currencyId: '1', price: 2);
  static AssetPrice assetPrice2 = const AssetPrice(assetId: '2', currencyId: '1', price: 3);
  static AssetPrice assetPrice3 = const AssetPrice(assetId: '1', currencyId: '2', price: 4);
  static List<AssetPrice> prices1 = [assetPrice1, assetPrice2];
  static List<AssetPrice> prices2 = [assetPrice1, assetPrice2, assetPrice3];
}
