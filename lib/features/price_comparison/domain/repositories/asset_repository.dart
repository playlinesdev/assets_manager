import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset.dart';

abstract class IAssetCrudRepository {
  Future<Asset> create(Asset asset);
  Future<Asset?> read(String id);
  Future<Asset> update(Asset asset);
  void delete(String id);
  Future<void> deleteAll();
}
