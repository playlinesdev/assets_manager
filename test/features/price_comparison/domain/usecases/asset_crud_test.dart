import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_repository.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/usecases/asset_crud.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CrudRepository extends Mock implements IAssetCrudRepository {}

void main() {
  late IAssetCrudRepository repository;
  late IAssetCrud crud;
  late Asset asset;

  setUp(() {
    asset = const Asset(name: 'Eager', id: '1');
    repository = CrudRepository();
    crud = AssetCrud(repository);
  });

  test('Should correctly create', () async {
    when(() => repository.create(asset)).thenAnswer((invocation) async => asset);
    expect(await crud.create(asset), asset);
    verify(() => repository.create(asset)).called(1);
  });

  test('Should correctly read', () async {
    when(() => repository.read('1')).thenAnswer((invocation) async => asset);
    expect(await crud.read('1'), asset);
    verify(() => repository.read('1')).called(1);
  });

  test('Should correctly update', () async {
    when(() => repository.update(asset)).thenAnswer((invocation) async => asset);
    expect(await crud.update(asset), asset);
    verify(() => repository.update(asset)).called(1);
  });

  test('Should correctly delete', () async {
    when(() => repository.delete('1')).thenReturn(null);
    crud.delete('1');
    verify(() => repository.delete('1')).called(1);
  });

  test('Should correctly deleteAll', () async {
    when(() => repository.deleteAll()).thenAnswer((invocation) async => await null);
    await crud.deleteAll();
    verify(() => repository.deleteAll()).called(1);
  });
}
