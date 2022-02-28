import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

enum AppErrorType{
  network,
  badRequest,
  unauthorized,
  cancel,
  timeout,
  server,
  unknown
}

class AppError{
  late String message;
  late AppErrorType type;

  AppError(Exception error){
    if(error is DioError){
      debugPrint('AppError(DioError): '
          'type is ${error.type}, message is ${error.message}');

      message = error.message;
      switch(error.type){
        case DioErrorType.other:
          if(error.error is SocketException){
            type = AppErrorType.network;
          }
          else{
            type = AppErrorType.unknown;
          }
          break;
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
          type = AppErrorType.timeout;
          break;

        case DioErrorType.sendTimeout:
          type = AppErrorType.network;
          break;

        case DioErrorType.response:
          switch(error.response!.statusCode){
            case HttpStatus.badRequest:
              type = AppErrorType.badRequest;
              break;

            case HttpStatus.unauthorized:
              type = AppErrorType.unauthorized;
              break;
            case HttpStatus.internalServerError: // 500
            case HttpStatus.badGateway: // 502
            case HttpStatus.serviceUnavailable: // 503
            case HttpStatus.gatewayTimeout: // 504
              type = AppErrorType.server;
              break;

            default:
              type = AppErrorType.unknown;
              break;
          }
          break;

        case DioErrorType.cancel:
          type = AppErrorType.cancel;
          break;
      }
    }
    else{
      debugPrint('AppError(UnKnown): $error');
      type = AppErrorType.unknown;
      message = 'AppError: $error';
    }
  }
}