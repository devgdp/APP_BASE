import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:post/src/core/network/network_config.dart';
import 'package:post/src/core/utils/dio_interceptor.dart';

class CustomDio extends DioForNative {
  Interceptor? _tokenInterception;
  String? _token;

  CustomDio() : super() {
    options.baseUrl = NetworkConfig.baseUrl;
  }

  updateToken(String? token) {
    _token = token;

    if (_tokenInterception != null) {
      if (interceptors.contains(_tokenInterception)) {
        if (interceptors.remove(_tokenInterception)) ;
      }
    }
    _tokenInterception = AuthInterceptors(_token);
    interceptors.add(_tokenInterception as Interceptor);
  }

  removeToken() {
    updateToken(null);
  }
}
