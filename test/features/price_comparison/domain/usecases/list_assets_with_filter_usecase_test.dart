import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/param_types.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_repository.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/usecases/list_assets_with_filter_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements IAssetCrudRepository {}

void main() {
  late IAssetCrudRepository repository;
  late ListAssetsWithFilterUsecase usecase;
  late Asset eager;
  late Asset rooster;

  setUp(() {
    eager = const Asset(name: 'Eager', id: '1');
    rooster = const Asset(name: 'Rooster', id: '2');
    repository = MockRepository();
    usecase = ListAssetsWithFilterUsecase(repository);
  });

  test('Should find correct entities by filter', () async {
    var list1 = [rooster];
    var list2 = [eager];
    var listFull = [eager, rooster];
    var listEmpty = <Asset>[];
    when(() => repository.getAssetsByFilter(id: '1')).thenAnswer((invocation) async => Right<Failure, List<Asset>>(list2));
    when(() => repository.getAssetsByFilter(name: 'Rooster')).thenAnswer((invocation) async => Right<Failure, List<Asset>>(list1));
    when(() => repository.getAssetsByFilter(name: 'er')).thenAnswer((invocation) async => Right<Failure, List<Asset>>(listFull));
    when(() => repository.getAssetsByFilter(name: 'abc')).thenAnswer((invocation) async => Right<Failure, List<Asset>>(listEmpty));

    var response = await usecase(const AssetsFilterParams(name: 'Rooster'));

    expect(response, Right(list1));
    verify(() => repository.getAssetsByFilter(name: 'Rooster')).called(1);

    response = await usecase(const AssetsFilterParams(name: 'er'));

    expect(response, Right(listFull));
    verify(() => repository.getAssetsByFilter(name: 'er')).called(1);

    response = await usecase(const AssetsFilterParams(name: 'abc'));

    expect(response, Right(listEmpty));
    verify(() => repository.getAssetsByFilter(name: 'abc')).called(1);
  });
}
