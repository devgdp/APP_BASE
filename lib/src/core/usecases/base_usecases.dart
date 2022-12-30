import 'package:dartz/dartz.dart';
import 'package:post/src/core/errors/failure.dart';

abstract class ParamUseCase<Type, Params> {
  Future<Either<Failure, Type>> execute(Params params);
}

abstract class NoParamUseCase<Type> {
  Future<Either<Failure, Type>> execute();
}
