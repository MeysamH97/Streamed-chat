import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService() : _dio = Dio(BaseOptions(
    baseUrl: 'https://6a3e-3-79-148-80.ngrok-free.app', // Sever address
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 10),
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  Dio get dio => _dio;
}
