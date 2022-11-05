import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_offer_repository.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/usecases/remove_asset_offer_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements IAssetOfferRepository {}

void main() {
  late String id;
  late IAssetOfferRepository repository;
  late RemoveAssetOfferUsecase usecase;

  setUp(() {
    id = '1';
    repository = MockRepository();
    usecase = RemoveAssetOfferUsecase(repository);
  });

  test('Should correctly remove asset offer by it\'s id', () async {
    when(() => repository.removeAssetOffer(id)).thenAnswer((invocation) async => const Right<Failure, bool>(true));

    var response = await usecase(id);

    expect(response, const Right(true));
    verify(() => repository.removeAssetOffer(id)).called(1);
  });

  test('Should return a Failure after trying to remove asset offer by it\'s id', () async {
    when(() => repository.removeAssetOffer(id)).thenAnswer((invocation) async => Left<Failure, bool>(Failure()));

    var response = await usecase(id);

    expect(response, Left(Failure()));
    verify(() => repository.removeAssetOffer(id)).called(1);
  });
}
