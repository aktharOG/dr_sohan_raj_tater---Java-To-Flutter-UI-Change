import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

Dio createDio() {
  final dio = Dio();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers["content-type"] = "application/json";
        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        return handler.next(response); // continue
      },
      onError: (DioError e, handler) {
        return handler.next(e); //continue
      },
    ),
  );

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  return dio;
}
