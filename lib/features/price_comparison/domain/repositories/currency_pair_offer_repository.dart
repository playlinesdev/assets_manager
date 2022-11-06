import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency_pair_offer.dart';

abstract class ICurrencyPairOfferCrudRepository {
  Future<CurrencyPairOffer> create(CurrencyPairOffer offer);
  Future<CurrencyPairOffer> read(String id);
  Future<CurrencyPairOffer> update(CurrencyPairOffer offer);
  void delete(String id);
  Future<void> deleteAll();
}
