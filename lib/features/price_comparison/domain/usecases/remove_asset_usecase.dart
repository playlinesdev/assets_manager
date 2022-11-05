import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/usecase.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_repository.dart';
import 'package:dartz/dartz.dart';

class RemoveAssetUsecase implements Usecase<bool, String> {
  final IAssetRepository repository;
  const RemoveAssetUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(String id) async {
    return await repository.removeAsset(id);
  }
}
