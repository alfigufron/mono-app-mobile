import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mono_app/common/failures/base_failure.dart';
import 'package:mono_app/common/failures/common_failure.dart';
import 'package:mono_app/common/mixins/api_result_error_checker_mixin.dart';
import 'package:mono_app/common/network/network_check.dart';
import 'package:mono_app/datasources/authentication.dart';
import 'package:mono_app/models/common/token.dart';
import 'package:mono_app/models/request/login_request.dart';
import 'package:mono_app/models/request/sign_up_request.dart';

abstract class AuthenticationRepository {
  Future<Either<BaseFailure, Token>> login(LoginRequest request);
  Future<Either<BaseFailure, bool>> register(SignUpRequest request);
}

@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends AuthenticationRepository
    with APIResultErrorChecker {
  final NetworkCheck networkCheck;
  final AuthenticationDatasource authenticationDatasource;
  AuthenticationRepositoryImpl({
    required this.networkCheck,
    required this.authenticationDatasource,
  });
  @override
  Future<Either<BaseFailure, Token>> login(LoginRequest request) async {
    final result = await authenticationDatasource.login(request);
    return checkServiceResultError<Token>(
      result: result,
      errorPrefix: 'Login Error: ',
      executeNext: () {
        try {
          return Right(
              Token.fromMap(result.internalResponse?.responseData?['data']));
        } catch (e) {
          return Left(JSONParseFailure(error: e));
        }
      },
    );
  }

  @override
  Future<Either<BaseFailure, bool>> register(SignUpRequest request) async {
    final result = await authenticationDatasource.signUp(request);
    return checkServiceResultError<bool>(
      result: result,
      errorPrefix: 'Register Error: ',
      executeNext: () {
        return Right(!(result.isExecError ?? false) &&
            result.internalResponse?.responseData?['meta']['code'] == null);
      },
    );
  }
}
