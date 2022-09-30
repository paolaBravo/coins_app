import 'package:coins_app/core/error/failures.dart';
import 'package:coins_app/features/data/models/coin_model.dart';
import 'package:dartz/dartz.dart';

abstract class CoinRepository {
  Future<Either<Failure, List<CoinItemModel>>> getCoinsInformation(
      int page, int limitItems, String filter);
  Future<Either<Failure, List<CoinItemModel>>> getCoinsByName(String name);
}
