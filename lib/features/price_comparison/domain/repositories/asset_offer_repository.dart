import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/param_types.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_offer.dart';
import 'package:dartz/dartz.dart';

abstract class IAssetOfferCrudRepository {
  Future<Either<Failure, AssetOffer>> getAssetOffer(String id);
  Future<Either<Failure, bool>> addAssetOffer(AssetOfferParams params);
  Future<Either<Failure, bool>> removeAssetOffer(String id);
  Future<Either<Failure, List<AssetOffer>>> getAssetOffers(String assetId);
}
