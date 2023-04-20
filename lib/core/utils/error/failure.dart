import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMsg;

  Failure(this.errorMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMsg);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection Timeout');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send Timeout');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive Timeout');

      case DioErrorType.badCertificate:
        return ServerFailure('Bad Certificate');

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('request canceld');
        
      case DioErrorType.connectionError:
        return ServerFailure('something wrong with internet connection please try again later');
        
      case DioErrorType.unknown:
        return ServerFailure('please try again later');
      default:return ServerFailure('please try again later');
        
        
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode >= 400 && statusCode <= 401) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('please try again later');
    }
  }
}
