import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/usecase.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency_entity.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';

class GetCurrencyBySymbolUsecase implements Usecase<CurrencyEntity, String> {
  final ICurrencyRepository repository;
  GetCurrencyBySymbolUsecase(this.repository);

  @override
  Future<Either<Failure, CurrencyEntity>> call(String symbol) async {
    return await repository.bySymbol(symbol);
  }
}
