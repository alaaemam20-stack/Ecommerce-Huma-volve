import 'package:dio/dio.dart';

class CachedExceptions implements Exception {
 
}

class ServerException implements Exception {
  DioException dioException;
  ServerException(this.dioException);
}
