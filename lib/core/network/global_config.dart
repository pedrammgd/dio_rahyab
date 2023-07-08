import 'package:dio/dio.dart';
import 'package:rahyab_flutter/core/network/logger_interceptor.dart';

Dio dioClient() {
  return Dio(BaseOptions(
      baseUrl: 'https://api.github.com/',
      // validateStatus: (status) {
      //   // Return true if the status code is within the expected range
      //   return status! >= 200 && status < 500;
      // },
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 5)) )..interceptors.addAll([

    LoggerInterceptor(),
  ]);
}


