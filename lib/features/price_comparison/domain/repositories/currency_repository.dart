import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency.dart';

abstract class ICurrencyCrudRepository {
  Future<Currency> create(Currency currency);
  Future<Currency?> read(String id);
  Future<Currency> update(Currency currency);
  void delete(String id);
  Future<void> deleteAll();
}
