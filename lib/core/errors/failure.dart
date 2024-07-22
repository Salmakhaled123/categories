import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class ServerFailure extends Failure
{
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioError(DioException error)
  {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure('your browser not certified');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            error.response!.statusCode!, error.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was cancelled');
      case DioExceptionType.connectionError:
        if (error.message!.contains('SocketException')) {
          return ServerFailure('No internet Connection');
        }
        return ServerFailure('No internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error,Please try again later');
      default:
        return ServerFailure('Oops There was an error,Please try again');

    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response)
  {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request not found,Please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error,Please try again later!');
    } else {
      return ServerFailure('Oops There was an error,Please try again');
    }
  }
}
