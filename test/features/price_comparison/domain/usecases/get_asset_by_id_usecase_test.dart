import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/errors/not_found_entity_failure.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_repository.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/usecases/get_asset_by_id_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements IAssetRepository {}

void main() {
  late IAssetRepository repository;
  late GetAssetByIdUsecase usecase;

  setUp(() {
    repository = MockRepository();
    usecase = GetAssetByIdUsecase(repository);
  });

  test('Should find an asset by it\'s id', () async {
    String id = '1';
    when(() => repository.getAssetById(id)).thenAnswer((invocation) async => const Right<Failure, Asset>(Asset(name: 'Eager', id: '1')));

    var response = await usecase(id);

    expect(response, const Right(Asset(name: 'Eager', id: '1')));
    verify(() => repository.getAssetById(id)).called(1);
  });

  test('Should return a Not Found Entity', () async {
    String id = '1';
    when(() => repository.getAssetById(id)).thenAnswer((invocation) async => Left<Failure, Asset>(NotFoundEntityFailure()));

    var response = await usecase(id);

    expect(response, Left(NotFoundEntityFailure()));
    verify(() => repository.getAssetById(id)).called(1);
  });
}
