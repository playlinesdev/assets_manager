import 'package:asset_arbitrage/features/price_comparison/domain/repositories/asset_price_repository.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/usecases/asset_price_reader.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock/asset_price_mock.dart';

class RepositoryMock extends Mock implements IAssetPriceRepository {}

void main() {
  late IAssetPriceReader reader;
  late IAssetPriceRepository repository;

  setUp(() {
    repository = RepositoryMock();
    reader = AssetPriceReader(repository);
  });

  test('Should get asset price in a given currency', () {
    var assetPrice = AssetPriceMock.assetPrice1;
    when(() => repository.getPriceInCurrency(currencyId: assetPrice.currencyId, assetId: assetPrice.assetId)).thenAnswer((invocation) => assetPrice);

    expect(reader.getPriceInCurrency(currencyId: assetPrice.currencyId, assetId: assetPrice.assetId), assetPrice);
    verify(() => repository.getPriceInCurrency(currencyId: assetPrice.currencyId, assetId: assetPrice.assetId)).called(1);
  });

  test('Should get asset price in a given currency for a given quantity', () {
    var assetPrice = AssetPriceMock.assetPrice1;
    when(() => repository.getPriceInCurrencyForQuantity(currencyId: assetPrice.currencyId, assetId: assetPrice.assetId, quantity: 1))
        .thenAnswer((invocation) => assetPrice);

    expect(reader.getPriceInCurrencyForQuantity(currencyId: assetPrice.currencyId, assetId: assetPrice.assetId, quantity: 1), assetPrice);
    verify(() => repository.getPriceInCurrencyForQuantity(currencyId: assetPrice.currencyId, assetId: assetPrice.assetId, quantity: 1)).called(1);
  });
  test('Should get asset price in a given list of currencies', () {
    var currencies = AssetPriceMock.currencies1;
    var priceList = AssetPriceMock.prices1;
    when(() => repository.getPriceInCurrencies(currencies: currencies, assetId: '1')).thenAnswer((invocation) => priceList);

    expect(reader.getPriceInCurrencies(currencies: currencies, assetId: '1'), priceList);
    verify(() => repository.getPriceInCurrencies(currencies: currencies, assetId: '1')).called(1);
  });
  test('Should get asset price in a given list of currencies for a given quantity', () {
    var currencies = AssetPriceMock.currencies1;
    var pricelist = AssetPriceMock.prices1;
    when(() => repository.getPriceInCurrenciesForQuantity(currencies: currencies, assetId: '1', quantity: 10)).thenAnswer((invocation) => pricelist);

    expect(reader.getPriceInCurrenciesForQuantity(currencies: currencies, assetId: '1', quantity: 10), pricelist);
    verify(() => repository.getPriceInCurrenciesForQuantity(currencies: currencies, assetId: '1', quantity: 10)).called(1);
  });
}
