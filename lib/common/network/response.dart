class APIResponse {
  final bool responseSuccess;
  final Map<String, dynamic>? responseData;
  final APIErrorResponse? responseError;

  APIResponse({
    required this.responseSuccess,
    this.responseData,
    this.responseError,
  });

  factory APIResponse.fromJson(Map<String, dynamic> json,
      {bool success = true}) {
    APIErrorResponse? error;
    try {
      error = !success ? APIErrorResponse.fromJson(json) : null;
    } catch (e) {
      Map<String, dynamic> unHandlingErr = {};
      unHandlingErr['code'] = -1;
      unHandlingErr['message'] = 'Unknown Error';
      error = APIErrorResponse.fromJson(unHandlingErr);
    }

    return APIResponse(
      responseSuccess: success,
      responseData: json,
      responseError: error,
    );
  }

  @override
  String toString() {
    return 'InternalResponse{responseSuccess: $responseSuccess, responseData: $responseData, responseError: $responseError}';
  }
}

class APIErrorResponse {
  final int code;
  final String message;

  APIErrorResponse(this.code, this.message);

  factory APIErrorResponse.fromJson(Map<String, dynamic> json) {
    return APIErrorResponse(
      json['code'] as int,
      json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
      };
}
