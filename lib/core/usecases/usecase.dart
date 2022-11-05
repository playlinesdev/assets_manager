import 'package:asset_arbitrage/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}
