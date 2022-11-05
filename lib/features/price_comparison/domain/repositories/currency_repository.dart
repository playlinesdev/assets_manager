import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ICurrencyRepository {
  Future<Either<Failure, CurrencyEntity>> bySymbol(String symbol);
  Future<Either<Failure, CurrencyEntity>> byName(String name);
  Future<Either<Failure, List<CurrencyEntity>>> listCurrenciesByFilter({String? name, String? symbol});
}
