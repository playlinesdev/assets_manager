import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/param_types.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset.dart';
import 'package:dartz/dartz.dart';

abstract class IAssetCrudRepository extends Either<Failure, Asset> {
  Future<Either<Failure, Asset>> getAssetById(String id);
  Future<Either<Failure, bool>> addAsset(AssetParams params);
  Future<Either<Failure, bool>> removeAsset(String id);
  Future<Either<Failure, List<Asset>>> getAssetsByFilter({String? id, String? name});
}
