import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/operation_type_enum.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_entity.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_offer_entity.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency_entity.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_offer_repository.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/usecases/get_asset_offers_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements IAssetOfferRepository {}

void main() {
  late String id;
  late IAssetOfferRepository repository;
  late GetAssetOffersUsecase usecase;
  late AssetOfferEntity assetOffer;
  late List<AssetOfferEntity> assetsList;

  setUp(() {
    id = '1';
    assetOffer = const AssetOfferEntity(
        asset: AssetEntity(name: 'Eager', id: '1'),
        operation: OperationTypeEnum.buy,
        price: 10.0,
        quantity: 1.0,
        currency: CurrencyEntity(name: 'Dollar', symbol: 'USDT'));
    assetsList = [assetOffer];
    repository = MockRepository();
    usecase = GetAssetOffersUsecase(repository);
  });

  test('Should return a list of 1 asset offer, searching by asset id 1', () async {
    when(() => repository.getAssetOffers(id)).thenAnswer((invocation) async => Right<Failure, List<AssetOfferEntity>>(assetsList));

    var response = await usecase(id);

    expect(response, Right(assetsList));
    verify(() => repository.getAssetOffers(id)).called(1);
  });

  test('Should return an empty list after searching for asset 2 offers', () async {
    when(() => repository.getAssetOffers('2')).thenAnswer((invocation) async => const Right<Failure, List<AssetOfferEntity>>([]));

    var response = await usecase('2');

    expect(response, const Right(<AssetOfferEntity>[]));
    verify(() => repository.getAssetOffers('2')).called(1);
  });
}
