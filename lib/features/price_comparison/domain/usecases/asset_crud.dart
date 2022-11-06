import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_repository.dart';

import '../entities/asset.dart';

abstract class IAssetCrud {
  Future<Asset> create(Asset asset);
  Future<Asset?> read(String id);
  Future<Asset> update(Asset asset);
  void delete(String id);
  Future<void> deleteAll();
}

class AssetCrud extends IAssetCrud {
  final IAssetCrudRepository repository;
  AssetCrud(this.repository);

  @override
  Future<Asset> create(Asset asset) => repository.create(asset);

  @override
  void delete(String id) {
    repository.delete(id);
  }

  @override
  Future<void> deleteAll() => repository.deleteAll();

  @override
  Future<Asset?> read(String id) => repository.read(id);

  @override
  Future<Asset> update(Asset asset) => repository.update(asset);
}
