import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:asset_arbitrage/core/usecases/usecase.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/entities/currency.dart';
import 'package:asset_arbitrage/features/price_comparison/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';

class GetCurrencyByNameUsecase implements Usecase<Currency, String> {
  final ICurrencyCrudRepository repository;
  GetCurrencyByNameUsecase(this.repository);

  @override
  Future<Either<Failure, Currency>> call(String name) async {
    return await repository.byName(name);
  }
}
