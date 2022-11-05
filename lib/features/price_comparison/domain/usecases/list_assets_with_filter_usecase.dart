import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/param_types.dart';
import 'package:asset_arbitrage/core/usecases/usecase.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_entity.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_repository.dart';
import 'package:dartz/dartz.dart';

class ListAssetsWithFilterUsecase implements Usecase<List<AssetEntity>, AssetsFilterParams> {
  final IAssetRepository repository;

  const ListAssetsWithFilterUsecase(this.repository);

  @override
  Future<Either<Failure, List<AssetEntity>>> call(AssetsFilterParams params) async {
    return await repository.getAssetsByFilter(id: params.id, name: params.name);
  }
}
