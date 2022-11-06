import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency_pair_offer.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/currency_pair_offer_repository.dart';

abstract class ICurrencyPairOfferCrud {
  Future<CurrencyPairOffer> create(CurrencyPairOffer offer);
  Future<CurrencyPairOffer> read(String id);
  Future<CurrencyPairOffer> update(CurrencyPairOffer offer);
  void delete(String id);
  Future<void> deleteAll();
}

class CurrencyPairOfferCrud implements ICurrencyPairOfferCrud {
  ICurrencyPairOfferCrudRepository repository;
  CurrencyPairOfferCrud(this.repository);

  @override
  Future<CurrencyPairOffer> create(CurrencyPairOffer offer) => repository.create(offer);
  @override
  void delete(String id) {
    repository.delete(id);
  }

  @override
  Future<void> deleteAll() => repository.deleteAll();

  @override
  Future<CurrencyPairOffer> read(String id) => repository.read(id);

  @override
  Future<CurrencyPairOffer> update(CurrencyPairOffer offer) => repository.update(offer);
}
