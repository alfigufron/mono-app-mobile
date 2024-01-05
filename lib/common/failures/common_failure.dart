import 'package:mono_app/common/failures/base_failure.dart';

class NoConnectionFailure extends BaseFailure {
  NoConnectionFailure() : super(message: 'Not connected to any active network');
}

class JSONParseFailure extends BaseFailure {
  JSONParseFailure({Object? error})
      : super(message: 'Failed to parse JSON: ${error.toString()}');
}

class GeneralFailure extends BaseFailure {
  GeneralFailure({
    String? prefixMessage,
    String? message,
    StackTrace? stackTrace,
    String? code,
    dynamic value,
  }) : super(
          message: '${prefixMessage ?? ''} $message',
          code: code,
          stackTrace: stackTrace,
          value: value,
        );
}
