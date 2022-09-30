import 'package:coins_app/core/error/failures.dart';
import 'package:coins_app/core/utility/usecase.dart';
import 'package:coins_app/features/domain/entities/coin_entity.dart';
import 'package:coins_app/features/domain/repositories/coin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCoinsInformation implements UseCase<List<CoinEntityItem>, Params> {
  final CoinRepository repository;

  GetCoinsInformation({required this.repository});

  @override
  Future<Either<Failure, List<CoinEntityItem>>> call(Params params) {
    return repository.getCoinsInformation(
        params.page, params.limit, params.filter);
  }
}

class Params extends Equatable {
  int page;
  int limit;
  String filter;

  Params({required this.limit, required this.page, required this.filter});
  @override
  List<Object> get props => [limit, page, filter];
}
