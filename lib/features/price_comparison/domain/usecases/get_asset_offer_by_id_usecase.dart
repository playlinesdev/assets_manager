import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/usecase.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_offer.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_offer_repository.dart';
import 'package:dartz/dartz.dart';

class GetAssetOfferByIdUsecase implements Usecase<AssetOffer, String> {
  final IAssetOfferRepository repository;
  const GetAssetOfferByIdUsecase(this.repository);

  @override
  Future<Either<Failure, AssetOffer>> call(String id) async {
    return await repository.getAssetOffer(id);
  }
}
