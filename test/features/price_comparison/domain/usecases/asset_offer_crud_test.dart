import 'package:asset_arbitrage/core/operation_type.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/asset_offer.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_offer_repository.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/usecases/asset_offer_crud.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CrudRepository extends Mock implements IAssetOfferCrudRepository {}

void main() {
  late IAssetOfferCrudRepository repository;
  late IAssetOfferCrud crud;
  late AssetOffer assetOffer;

  setUp(() {
    assetOffer = const AssetOffer(
        asset: Asset(name: 'Eager', id: '1'),
        operation: OperationType.buy,
        price: 10,
        quantity: 5,
        currency: Currency(name: 'Dollar', symbol: 'USD'));
    repository = CrudRepository();
    crud = AssetOfferCrud(repository);
  });

  test('Should correctly create', () async {
    when(() => repository.create(assetOffer)).thenAnswer((invocation) async => assetOffer);
    expect(await crud.create(assetOffer), assetOffer);
    verify(() => repository.create(assetOffer)).called(1);
  });

  test('Should correctly read', () async {
    when(() => repository.read('1')).thenAnswer((invocation) async => assetOffer);
    expect(await crud.read('1'), assetOffer);
    verify(() => repository.read('1')).called(1);
  });

  test('Should correctly update', () async {
    when(() => repository.update(assetOffer)).thenAnswer((invocation) async => assetOffer);
    expect(await crud.update(assetOffer), assetOffer);
    verify(() => repository.update(assetOffer)).called(1);
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
