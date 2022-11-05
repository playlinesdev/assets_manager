import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/errors/not_found_entity_failure.dart';
import 'package:asset_arbitrage/core/usecases/param_types.dart';
import 'package:asset_arbitrage/core/usecases/usecase.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_entity.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_repository.dart';
import 'package:dartz/dartz.dart';

class GetAssetByIdUsecase implements Usecase<AssetEntity, String> {
  final IAssetRepository repository;
  const GetAssetByIdUsecase(this.repository);

  @override
  Future<Either<Failure, AssetEntity>> call(String id) async {
    return await repository.getAssetById(id);
  }
}