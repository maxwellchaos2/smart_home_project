import 'package:common/common.dart';
import 'package:dio/dio.dart';

abstract final class DioExceptionMapper {
  static Failure toFailure(DioException from) {
    return Failure.api(
      message: toMessage(from),
      code: toCode(from),
    );
  }

  static String toCode(DioException from) {
    if (from.response?.data case {"code": int code}) {
      return code.toString();
    }
    return 'api-error';
  }

  static String toMessage(DioException from) {
    switch (from.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout';
      case DioExceptionType.sendTimeout:
        return 'Send timeout';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout';
      case DioExceptionType.badResponse:
        if (from.response?.data
            case {"status": false, "message": String error}) {
          return error;
        }
        return from.message ?? 'Bad response';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.connectionError:
        return 'Connection error';
      default:
        return 'Unknown error';
    }
  }
}
