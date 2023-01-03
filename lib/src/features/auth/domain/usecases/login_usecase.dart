import 'package:post/src/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:post/src/features/app/domain/entities/user_app.dart';
import 'package:post/src/features/auth/domain/entities/login_params.dart';
import 'package:post/src/features/auth/domain/repositories/login_repository.dart';
import 'package:post/src/core/usecases/base_usecases.dart';

class LoginUseCase extends ParamUseCase<UserApp, LoginParams> {
  final LoginRepository repository;

  LoginUseCase(this.repository);
  @override
  Future<Either<Failure, UserApp>> execute(LoginParams params) {
    return repository.login(params);
  }
}
