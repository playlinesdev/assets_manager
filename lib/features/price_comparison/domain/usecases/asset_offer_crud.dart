import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_offer.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_offer_repository.dart';

abstract class IAssetOfferCrud {
  Future<AssetOffer> create(AssetOffer assetOffer);
  Future<AssetOffer?> read(String id);
  Future<AssetOffer> update(AssetOffer assetOffer);
  void delete(String id);
  Future<void> deleteAll();
}

class AssetOfferCrud implements IAssetOfferCrud {
  IAssetOfferCrudRepository repository;
  AssetOfferCrud(this.repository);

  @override
  Future<AssetOffer> create(AssetOffer assetOffer) => repository.create(assetOffer);
  @override
  void delete(String id) {
    repository.delete(id);
  }

  @override
  Future<void> deleteAll() => repository.deleteAll();

  @override
  Future<AssetOffer?> read(String id) => repository.read(id);

  @override
  Future<AssetOffer> update(AssetOffer assetOffer) => repository.update(assetOffer);
}
