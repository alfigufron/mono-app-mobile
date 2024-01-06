import 'package:dio/dio.dart';
import 'package:mono_app/config.dart';
import 'dart:io';

abstract class DioOptions {
  Options tokenHeaders({required String token}) {
    return Options(headers: {
      HttpHeaders.authorizationHeader: token,
    });
  }

  BaseOptions get baseOptions;
}


class MonoDioOptions extends DioOptions {
  @override
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: Config.baseUrl,
        connectTimeout: Config.connectTimeout,
        receiveTimeout: Config.receiveTimeout,
      );
}
