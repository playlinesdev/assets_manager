import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/usecase.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_offer_entity.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_offer_repository.dart';
import 'package:dartz/dartz.dart';

class GetAssetOffersUsecase implements Usecase<List<AssetOfferEntity>, String> {
  final IAssetOfferRepository repository;
  const GetAssetOffersUsecase(this.repository);

  @override
  Future<Either<Failure, List<AssetOfferEntity>>> call(String id) async {
    return await repository.getAssetOffers(id);
  }
}
