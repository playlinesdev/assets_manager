import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency.dart';
import 'package:dartz/dartz.dart';

abstract class ICurrencyRepository {
  Future<Either<Failure, Currency>> bySymbol(String symbol);
  Future<Either<Failure, Currency>> byName(String name);
  Future<Either<Failure, List<Currency>>> listCurrenciesByFilter({String? name, String? symbol});
}
