import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/currency_repository.dart';

abstract class ICurrencyCrud {
  Future<Currency> create(Currency currency);
  Future<Currency?> read(String id);
  Future<Currency> update(Currency currency);
  void delete(String id);
  Future<void> deleteAll();
}

class CurrencyCrud implements ICurrencyCrud {
  ICurrencyCrudRepository repository;
  CurrencyCrud(this.repository);

  @override
  Future<Currency> create(Currency currency) => repository.create(currency);

  @override
  void delete(String id) {
    repository.delete(id);
  }

  @override
  Future<void> deleteAll() => repository.deleteAll();

  @override
  Future<Currency?> read(String id) => repository.read(id);

  @override
  Future<Currency> update(Currency currency) => repository.update(currency);
}
