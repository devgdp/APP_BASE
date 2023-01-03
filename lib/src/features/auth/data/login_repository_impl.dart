import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:post/src/core/network/network_config.dart';
import 'package:post/src/features/auth/domain/entities/login_params.dart';
import 'package:post/src/features/app/domain/entities/user_app.dart';
import 'package:post/src/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:post/src/features/auth/domain/repositories/login_repository.dart';
import 'package:post/src/core/network/api_routes.dart';

class LoginRepositoryImpl extends LoginRepository {
  final Dio dio;
  final Dio dioClient = Dio();

  LoginRepositoryImpl(this.dio);
  @override
  Future<Either<Failure, UserApp>> login(LoginParams params) async {
    try {
      final response = await dioClient
          .post(NetworkConfig.baseUrl + ApiRoutes.login, data: params.toJson());
      return Right(UserApp.fromJson(response.data));
    } on DioError catch (err) {
      log(err.toString());
      return Left(
          ServerFailure(message: 'POST Login: ${err.message}', dioError: err));
    }
  }
}
