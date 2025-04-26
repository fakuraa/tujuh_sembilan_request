import 'package:dio/dio.dart';
import 'package:tujuh_sembilan_request/data/remote/interceptor/api_log_interceptor.dart';
import '../model/user.dart';

class ApiService {
  final Dio dio;
  String? _accessToken;
  void Function()? onUnauthorized;

  ApiService({String baseUrl = "https://dummyjson.com/", this.onUnauthorized})
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    dio.interceptors.add(APILogInterceptor());
  }

  void setAuthToken(String token) {
    _accessToken = token;
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<User?> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {'username': username, 'password': password},
      );

      var status = (response.statusCode ?? 0);
      if (status >= 200 && status <= 299) {
        return User.fromMap(response.data);
      } else {
        throw Exception('Failed to login. Please try again.');
      }
    } on DioException catch (e) {
      _handleError(e);
    } catch (e) {
      throw Exception('Unexpected error occurred');
    }
    return null;
  }

  Future<User?> getUser({String? token}) async {
    try {
      final authHeader = token ?? _accessToken;

      if (authHeader == null) {
        onUnauthorized?.call();
        return null;
      }

      final response = await dio.get(
        '/auth/me',
        options: Options(headers: {'Authorization': 'Bearer $authHeader'}),
      );
      var status = (response.statusCode ?? 0);
      if (status >= 200 && status <= 299) {
        return User.fromMap(response.data);
      } else {
        throw Exception('Failed to get User');
      }
    } on DioException catch (e) {
      _handleError(e);
    } catch (e) {
      throw Exception('Unexpected error occurred');
    }
    return null;
  }

  void _handleError(DioException err) {
    if (err.response?.statusCode == 401) {
      onUnauthorized?.call();
    }
    final errorMessage =
        err.response?.data['message'] ??
        err.response?.statusMessage ??
        err.error ??
        'Oops.. An error occurred';
    throw DioException(
      requestOptions: err.requestOptions,
      message: errorMessage,
    );
  }
}
