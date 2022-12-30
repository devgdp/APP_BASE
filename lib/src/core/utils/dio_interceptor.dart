import 'package:dio/dio.dart';

class AuthInterceptors extends InterceptorsWrapper {
  final String? token;

  AuthInterceptors(this.token);

  // ! Chamar o AuthController

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // !Setar mensagem de erro na AuthController
      return;
    }
    super.onError(err, handler);
  }
}
