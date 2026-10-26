
import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';

class ErrorHandler {
  static Failure handle(dynamic exception) {
    if (exception is DioException) {
      return _handleDioError(exception);
    }

    return const Failure(
      failureMessage: 'Something went wrong. Please try again.',
    );
  }

  static Failure _handleDioError(DioException exception) {
    final statusCode = exception.response?.statusCode;

    switch (statusCode) {
      case 400:
        return const Failure(
          failureMessage: 'Invalid request. Please check your input.',
        );

      case 401:
        return const Failure(
          failureMessage: 'Unauthorized. Please log in again.',
        );

      case 403:
        return const Failure(
          failureMessage: 'Access denied. You do not have permission.',
        );

      case 404:
        return const Failure(
          failureMessage: 'The requested data was not found.',
        );

      case 422:
        return const Failure(
          failureMessage: 'Invalid input. Please check your data.',
        );

      case 500:
      case 501:
      case 502:
      case 503:
      case 504:
        return const Failure(
          failureMessage: 'Server error. Please try again later.',
        );
    }

  switch (exception.type) {
  case DioExceptionType.connectionTimeout:
  case DioExceptionType.sendTimeout:
  case DioExceptionType.receiveTimeout:
  case DioExceptionType.transformTimeout:
    return const Failure(
      failureMessage: 'Connection timed out. Please try again.',
    );

  case DioExceptionType.connectionError:
    return const Failure(
      failureMessage:
          'No internet connection. Please check your network.',
    );

  case DioExceptionType.badCertificate:
    return const Failure(
      failureMessage: 'Secure connection failed.',
    );

  case DioExceptionType.cancel:
    return const Failure(
      failureMessage: 'The request was cancelled.',
    );

  case DioExceptionType.badResponse:
    return const Failure(
      failureMessage: 'Server error. Please try again.',
    );

  case DioExceptionType.unknown:
    return const Failure(
      failureMessage: 'An unexpected network error occurred.',
    );
}
  }
}
