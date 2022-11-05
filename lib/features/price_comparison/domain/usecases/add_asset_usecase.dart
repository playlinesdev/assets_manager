import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/param_types.dart';
import 'package:asset_arbitrage/core/usecases/usecase.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_repository.dart';
import 'package:dartz/dartz.dart';

class AddAssetUsecase implements Usecase<bool, AssetParams> {
  final IAssetRepository repository;
  const AddAssetUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(AssetParams params) async {
    return await repository.addAsset(params);
  }
}
