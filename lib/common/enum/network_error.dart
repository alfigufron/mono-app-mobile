enum NetworkError {
  unauthorized,
  contentNotFound,
  serviceTimeout,
  serviceNotFound,
  socketException,
  unknownError,
}

extension ErrorTypeMessage on NetworkError {
  String? get message => valueMap[this];

  static const valueMap = {
    NetworkError.unauthorized: "Unauthorized",
    NetworkError.contentNotFound: "Not Found",
    NetworkError.serviceTimeout: "Connection Timeout",
    NetworkError.serviceNotFound: "Endpoint Not Found",
    NetworkError.socketException: "Failed host lookup",
    NetworkError.unknownError: "Unknown Error",
  };
}
