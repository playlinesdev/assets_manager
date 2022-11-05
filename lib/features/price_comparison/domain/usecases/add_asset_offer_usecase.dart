import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/param_types.dart';
import 'package:asset_arbitrage/core/usecases/usecase.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_offer_repository.dart';
import 'package:dartz/dartz.dart';

class AddAssetOfferUsecase implements Usecase<bool, AssetOfferParams> {
  final IAssetOfferRepository repository;
  AddAssetOfferUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(AssetOfferParams params) async {
    return await repository.addAssetOffer(params);
  }
}
