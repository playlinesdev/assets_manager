import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/usecase.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_offer_repository.dart';
import 'package:dartz/dartz.dart';

class RemoveAssetOfferUsecase implements Usecase<bool, String> {
  final IAssetOfferCrudRepository repository;
  const RemoveAssetOfferUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(String id) async {
    return await repository.removeAssetOffer(id);
  }
}
