import 'package:coins_app/core/error/failures.dart';
import 'package:coins_app/features/domain/entities/coin_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CoinRepository {
  Future<Either<Failure, List<CoinEntityItem>>> getCoinsInformation(
      int page, int limitItems, String filter);
  Future<Either<Failure, List<CoinEntityItem>>> getCoinsByName(String name);
}
