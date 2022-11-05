import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/operation_type_enum.dart';
import 'package:asset_arbitrage/core/usecases/param_types.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency_entity.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_offer_repository.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/usecases/add_asset_offer_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements IAssetOfferRepository {}

void main() {
  late IAssetOfferRepository repository;
  late AddAssetOfferUsecase usecase;
  late AssetOfferParams assetOfferParams;

  setUp(() {
    assetOfferParams = const AssetOfferParams(
        assetId: '1', operation: OperationTypeEnum.buy, price: 10.0, quantity: 1.0, currency: CurrencyEntity(name: 'Dollar', symbol: 'USDT'));
    repository = MockRepository();
    usecase = AddAssetOfferUsecase(repository);
  });

  test('Should return true after adding correctly the asset offer', () async {
    when(() => repository.addAssetOffer(assetOfferParams)).thenAnswer((invocation) async => const Right<Failure, bool>(true));

    var response = await usecase(assetOfferParams);

    expect(response, const Right(true));
    verify(() => repository.addAssetOffer(assetOfferParams)).called(1);
  });

  test('Should return a false after failing to add an asset offer', () async {
    when(() => repository.addAssetOffer(assetOfferParams)).thenAnswer((invocation) async => const Right<Failure, bool>(false));

    var response = await usecase(assetOfferParams);

    expect(response, const Right(false));
    verify(() => repository.addAssetOffer(assetOfferParams)).called(1);
  });
}
