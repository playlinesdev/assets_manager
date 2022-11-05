import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/param_types.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IAssetRepository extends Either<Failure, AssetEntity> {
  Future<Either<Failure, AssetEntity>> getAssetById(String id);
  Future<Either<Failure, bool>> addAsset(AssetParams params);
  Future<Either<Failure, bool>> removeAsset(String id);
  Future<Either<Failure, List<AssetEntity>>> getAssetsByFilter({String? id, String? name});
}
