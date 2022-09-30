import 'package:coins_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

//TODO: SI VEO QUE NO SE NECESITA, ELIMINAR
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
