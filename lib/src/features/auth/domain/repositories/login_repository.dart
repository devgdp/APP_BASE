import 'package:dartz/dartz.dart';
import 'package:post/src/core/errors/failure.dart';
import 'package:post/src/features/app/domain/entities/user_app.dart';
import 'package:post/src/features/auth/domain/entities/login_params.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserApp>> login(LoginParams params);
}
