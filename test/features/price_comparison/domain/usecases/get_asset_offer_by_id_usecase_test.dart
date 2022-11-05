import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/errors/not_found_entity_failure.dart';
import 'package:asset_arbitrage/core/operation_type_enum.dart';
import 'package:asset_arbitrage/core/usecases/param_types.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_entity.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_offer_entity.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_offer_repository.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/usecases/add_asset_offer_usecase.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/usecases/get_asset_offer_by_id_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements IAssetOfferRepository {}

void main() {
  late String id;
  late IAssetOfferRepository repository;
  late GetAssetOfferByIdUsecase usecase;
  late AssetOfferEntity assetOffer;

  setUp(() {
    id = '1';
    assetOffer = const AssetOfferEntity(asset: AssetEntity(name: 'Eager', id: '1'), operation: OperationTypeEnum.buy, price: 10.0, quantity: 1.0);
    repository = MockRepository();
    usecase = GetAssetOfferByIdUsecase(repository);
  });

  test('Should return an asset offer by it\'s id', () async {
    when(() => repository.getAssetOffer(id)).thenAnswer((invocation) async => Right<Failure, AssetOfferEntity>(assetOffer));

    var response = await usecase(id);

    expect(response, Right(assetOffer));
    verify(() => repository.getAssetOffer(id)).called(1);
  });

  test('Should return a NotFoundEntity failure after trying to find asset offer by it\'s id', () async {
    when(() => repository.getAssetOffer(id)).thenAnswer((invocation) async => Left<Failure, AssetOfferEntity>(NotFoundEntityFailure()));

    var response = await usecase(id);

    expect(response, Left(NotFoundEntityFailure()));
    verify(() => repository.getAssetOffer(id)).called(1);
  });
}
