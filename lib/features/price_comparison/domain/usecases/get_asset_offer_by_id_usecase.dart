import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/usecase.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_offer_entity.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_offer_repository.dart';
import 'package:dartz/dartz.dart';

class GetAssetOfferByIdUsecase implements Usecase<AssetOfferEntity, String> {
  final IAssetOfferRepository repository;
  const GetAssetOfferByIdUsecase(this.repository);

  @override
  Future<Either<Failure, AssetOfferEntity>> call(String id) async {
    return await repository.getAssetOffer(id);
  }
}
