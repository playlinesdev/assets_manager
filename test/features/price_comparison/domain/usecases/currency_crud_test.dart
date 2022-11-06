import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/currency_repository.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/usecases/currency_crud.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CrudRepository extends Mock implements ICurrencyCrudRepository {}

void main() {
  late ICurrencyCrudRepository repository;
  late ICurrencyCrud crud;
  late Currency currency;

  setUp(() {
    currency = const Currency(name: 'Dollar', symbol: 'USD');
    repository = CrudRepository();
    crud = CurrencyCrud(repository);
  });

  test('Should correctly create', () async {
    when(() => repository.create(currency)).thenAnswer((invocation) async => currency);
    expect(await crud.create(currency), currency);
    verify(() => repository.create(currency)).called(1);
  });

  test('Should correctly read', () async {
    when(() => repository.read('1')).thenAnswer((invocation) async => currency);
    expect(await crud.read('1'), currency);
    verify(() => repository.read('1')).called(1);
  });

  test('Should correctly update', () async {
    when(() => repository.update(currency)).thenAnswer((invocation) async => currency);
    expect(await crud.update(currency), currency);
    verify(() => repository.update(currency)).called(1);
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
