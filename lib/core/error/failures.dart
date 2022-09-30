import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message = 'something went wrong';
  const Failure([List properties = const <dynamic>[]]);
}

class GeneralFailure extends Failure {
  final String message;
  const GeneralFailure(this.message);
  @override
  List<Object> get props => [message];
}

class UnexpectedFailure extends Failure {
  @override
  List<Object> get props => [];
}
