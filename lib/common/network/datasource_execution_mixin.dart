import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mono_app/common/enum/network_error.dart';
import 'package:mono_app/common/network/api_result.dart';
import 'package:mono_app/common/network/response.dart';


mixin DatasourceExecutionMixin {
  Future<APIResult> exec(Future<Response<dynamic>> post) async {
    APIResult serviceResult = APIResult();
    Response res;
    try {
      res = await post;
      var internalRes = APIResponse.fromJson(res.data, success: true);
      serviceResult.internalResponse = internalRes;
      serviceResult.execStatusCode = res.statusCode;
      serviceResult.isExecError = false;
      serviceResult.execErrorType = null;
      serviceResult.execErrorMessage = null;
    } on DioError catch (ex) {
      NetworkError? errorType;

      if (ex.error is SocketException) {
        errorType = NetworkError.socketException;
      }

      if (ex.type == DioErrorType.connectTimeout) {
        errorType = NetworkError.serviceTimeout;
      }

      if (ex.response != null) {
        if (ex.response!.statusCode == 404) {
          errorType = NetworkError.serviceNotFound;
        } else if (ex.response!.statusCode == 401) {
          errorType = NetworkError.unauthorized;
        } else {
          errorType = NetworkError.unknownError;
        }

        if (ex.response!.data is Map && ex.response!.data['message'] != null) {
          final backendResponse = ex.response!.data['message'];
          serviceResult.execErrorMessage = backendResponse;
        } else {
          serviceResult.execErrorMessage = ex.message;
        }
        serviceResult.execStatusCode = ex.response!.statusCode;
      }

      serviceResult.internalResponse = null;
      serviceResult.isExecError = true;
      serviceResult.execErrorType = errorType;
    }

    return serviceResult;
  }
}
