import 'package:coins_app/core/error/failures.dart';
import 'package:coins_app/core/utility/usecase.dart';
import 'package:coins_app/features/domain/entities/coin_entity.dart';
import 'package:coins_app/features/domain/repositories/coin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCoinsByName implements UseCase<List<CoinEntityItem>, Param> {
  final CoinRepository repository;

  GetCoinsByName({required this.repository});

  @override
  Future<Either<Failure, List<CoinEntityItem>>> call(Param params) {
    return repository.getCoinsByName(params.name);
  }
}

class Param extends Equatable {
  String name;

  Param({required this.name});
  @override
  List<Object> get props => [name];
}
