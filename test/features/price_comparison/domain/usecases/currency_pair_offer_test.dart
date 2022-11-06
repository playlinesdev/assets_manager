import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency_pair_offer.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/currency_pair_offer_repository.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/usecases/currency_pair_offer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CrudRepository extends Mock implements ICurrencyPairOfferCrudRepository {}

void main() {
  late ICurrencyPairOfferCrudRepository repository;
  late ICurrencyPairOfferCrud crud;
  late CurrencyPairOffer offer;

  setUp(() {
    offer = const CurrencyPairOffer(baseCurrencyId: '1', price: 5, quantity: 10, targetCurrencyId: '2');
    repository = CrudRepository();
    crud = CurrencyPairOfferCrud(repository);
  });

  test('Should correctly create', () async {
    when(() => repository.create(offer)).thenAnswer((invocation) async => offer);
    expect(await crud.create(offer), offer);
    verify(() => repository.create(offer)).called(1);
  });

  test('Should correctly read', () async {
    when(() => repository.read('1')).thenAnswer((invocation) async => offer);
    expect(await crud.read('1'), offer);
    verify(() => repository.read('1')).called(1);
  });

  test('Should correctly update', () async {
    when(() => repository.update(offer)).thenAnswer((invocation) async => offer);
    expect(await crud.update(offer), offer);
    verify(() => repository.update(offer)).called(1);
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
