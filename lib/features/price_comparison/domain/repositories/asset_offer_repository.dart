import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_offer.dart';

abstract class IAssetOfferCrudRepository {
  Future<AssetOffer> create(AssetOffer assetOffer);
  Future<AssetOffer?> read(String id);
  Future<AssetOffer> update(AssetOffer assetOffer);
  void delete(String id);
  Future<void> deleteAll();
}
