import 'package:mono_app/common/enum/network_error.dart';
import 'package:mono_app/common/network/response.dart';

class APIResult {
  APIResponse? internalResponse;
  bool? isExecError;
  NetworkError? execErrorType;
  String? execErrorMessage;
  int? execStatusCode;
}
