// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mono_app/common/constants/storage_keys.dart';
import 'package:mono_app/common/helper/util.dart';
import 'package:mono_app/models/common/token.dart';

class HTTPClient {
  final Dio dio;
  final FlutterSecureStorage storage;

  HTTPClient(this.dio, this.storage, {bool isLogEnable = false}) {
    dio.interceptors.addAll({
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _getToken();

          if (token != null) {
            if (token.refreshToken == 0) {
              return handler.reject(
                DioError(
                  requestOptions: options,
                  error: DioErrorType.other,
                ),
                true,
              );
            } else {
              options.headers[HttpHeaders.authorizationHeader] =
                  'Bearer ${token.accessToken}';
              return handler.next(options);
            }
          }
          return handler.next(options);
        },
      ),
      LogInterceptor(
        requestBody: isLogEnable,
        responseBody: isLogEnable,
        request: isLogEnable,
        error: isLogEnable,
        requestHeader: isLogEnable,
        responseHeader: isLogEnable,
      ),
    });
  }

  Future<Token?> _getToken() async {
    final rawToken = await storage.read(key: CommonStorageKeys.token);
    if (!Util.falsyChecker(rawToken)) {
      return Token.fromJson(rawToken!);
    }
    return null;
  }
}
