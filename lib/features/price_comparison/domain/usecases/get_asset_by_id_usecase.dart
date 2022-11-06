import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/usecase.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_repository.dart';
import 'package:dartz/dartz.dart';

class GetAssetByIdUsecase implements Usecase<Asset, String> {
  final IAssetCrudRepository repository;
  const GetAssetByIdUsecase(this.repository);

  @override
  Future<Either<Failure, Asset>> call(String id) async {
    return await repository.getAssetById(id);
  }
}
