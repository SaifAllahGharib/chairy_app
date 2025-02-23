import 'package:chairy_app/core/errors/failure.dart';
import 'package:dio/dio.dart';

class ErrorHandler {
  static Failure handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else if (error is FormatException) {
      return const ServerFailure("Invalid data format");
    } else {
      return const UnknownFailure();
    }
  }

  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const NetworkFailure();

      case DioExceptionType.badResponse:
        return ServerFailure(_extractErrorMessage(error));

      case DioExceptionType.cancel:
        return const ServerFailure("Request was cancelled");

      default:
        return const UnknownFailure();
    }
  }

  static String _extractErrorMessage(DioException error) {
    try {
      return error.response?.data["message"] ?? "Server Error";
    } catch (_) {
      return "Server Error";
    }
  }
}
