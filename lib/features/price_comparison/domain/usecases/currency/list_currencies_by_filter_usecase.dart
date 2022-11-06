import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/param_types.dart';
import 'package:asset_arbitrage/core/usecases/usecase.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';

class ListCurrenciesByFilterUsecase implements Usecase<List<Currency>, CurrencyFilterParams> {
  final ICurrencyRepository repository;
  ListCurrenciesByFilterUsecase(this.repository);

  @override
  Future<Either<Failure, List<Currency>>> call(params) async {
    return await repository.listCurrenciesByFilter(name: params.name, symbol: params.symbol);
  }
}
