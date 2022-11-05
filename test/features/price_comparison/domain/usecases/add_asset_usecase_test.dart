import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/param_types.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_repository.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/usecases/add_asset_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements IAssetRepository {}

void main() {
  late IAssetRepository repository;
  late AddAssetUsecase usecase;

  setUp(() {
    repository = MockRepository();
    usecase = AddAssetUsecase(repository);
  });

  test('Should return true after adding correctly the asset', () async {
    var addParams = const AssetParams(id: '1', name: 'Eager');

    when(() => repository.addAsset(addParams)).thenAnswer((invocation) async => const Right<Failure, bool>(true));

    var answer = await usecase(addParams);

    expect(answer, const Right(true));
    verify(() => repository.addAsset(addParams)).called(1);
  });

  test('Should return a false after failing to add an asset', () async {
    var addParams = const AssetParams(id: '1', name: 'Eager');
    when(() => repository.addAsset(addParams)).thenAnswer((invocation) async => const Right<Failure, bool>(false));

    var response = await usecase(addParams);

    expect(response, const Right(false));
    verify(() => repository.addAsset(addParams)).called(1);
  });
}
