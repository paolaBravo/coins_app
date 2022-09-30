import 'package:coins_app/features/data/datasources/coin_remote_data_source.dart';
import 'package:coins_app/core/error/failures.dart';
import 'package:coins_app/features/domain/entities/coin_entity.dart';
import 'package:coins_app/features/domain/repositories/coin_repository.dart';
import 'package:dartz/dartz.dart';

class CoinRepositoryImpl implements CoinRepository {
  final CoinRemoteDataSource dataSource;

  CoinRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, List<CoinEntityItem>>> getCoinsInformation(
      int page, int limitItems, String filter) async {
    try {
      final response =
          await dataSource.getCoinsInformation(page, limitItems, filter);
      return Right(response);
    } on Exception catch (e) {
      return Left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CoinEntityItem>>> getCoinsByName(
      String name) async {
    try {
      final response = await dataSource.getCoinsByName(name);
      return Right(response);
    } on Exception catch (e) {
      return Left(GeneralFailure(e.toString()));
    }
  }
}
