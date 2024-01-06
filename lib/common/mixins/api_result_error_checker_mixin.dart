import 'package:dartz/dartz.dart';
import 'package:mono_app/common/failures/base_failure.dart';
import 'package:mono_app/common/failures/common_failure.dart';
import 'package:mono_app/common/helper/util.dart';
import 'package:mono_app/common/network/api_result.dart';

mixin APIResultErrorChecker {
  Either<BaseFailure, ReturnType> checkServiceResultError<ReturnType>({
    required APIResult result,
    required Either<BaseFailure, ReturnType> Function() executeNext,
    Left<BaseFailure, ReturnType> Function()? onExecErrorHandler,
    Left<BaseFailure, ReturnType> Function()? onNullResponseHandler,
    String? errorPrefix,
  }) {
    if (!Util.falsyChecker(result.execErrorMessage)) {
      if (onExecErrorHandler != null) {
        return onExecErrorHandler();
      }
      return Left(
        GeneralFailure(
          message: result.execErrorMessage,
          prefixMessage: errorPrefix,
        ),
      );
    } else if (result.internalResponse?.responseData == null) {
      if (onNullResponseHandler != null) {
        return onNullResponseHandler();
      }
      return Left(
        GeneralFailure(
          message: result.internalResponse?.responseError?.message,
          prefixMessage: errorPrefix,
        ),
      );
    }
    return executeNext();
  }
}
