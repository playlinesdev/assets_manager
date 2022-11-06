import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_repository.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/usecases/remove_asset_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements IAssetCrudRepository {}

void main() {
  late IAssetCrudRepository repository;
  late RemoveAssetUsecase usecase;
  late String id;

  setUp(() {
    id = '1';
    repository = MockRepository();
    usecase = RemoveAssetUsecase(repository);
  });

  test('Should correctly remove asset by it\'s id', () async {
    when(() => repository.removeAsset(id)).thenAnswer((invocation) async => const Right<Failure, bool>(true));

    var response = await usecase(id);

    expect(response, const Right(true));
    verify(() => repository.removeAsset(id)).called(1);
  });

  test('Should return a Failure after trying to remove asset by it\'s id', () async {
    String id = '1';
    when(() => repository.removeAsset(id)).thenAnswer((invocation) async => Left<Failure, bool>(Failure()));

    var response = await usecase(id);

    expect(response, Left(Failure()));
    verify(() => repository.removeAsset(id)).called(1);
  });
}
