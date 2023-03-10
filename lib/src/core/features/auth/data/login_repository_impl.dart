import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:post/src/core/features/auth/domain/entities/login_params.dart';
import 'package:post/src/core/features/app/domain/entities/user_app.dart';
import 'package:post/src/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:post/src/core/features/auth/domain/repositories/login_repository.dart';
import 'package:post/src/core/network/api_routes.dart';

class LoginRepositoryImpl extends LoginRepository {
  final Dio dio;

  LoginRepositoryImpl(this.dio);
  @override
  Future<Either<Failure, UserApp>> login(LoginParams params) async {
    try {
      final response = await dio.post(ApiRoutes.login, data: params.toJson());
      return Right(UserApp.fromJson(response.data));
    } on DioError catch (err) {
      log(err.toString());
      return Left(
          ServerFailure(message: 'POST Login: ${err.message}', dioError: err));
    }
  }
}
