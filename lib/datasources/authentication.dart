import 'package:injectable/injectable.dart';
import 'package:mono_app/common/constants/endpoints.dart';
import 'package:mono_app/common/network/api_result.dart';
import 'package:mono_app/common/network/datasource_execution_mixin.dart';
import 'package:mono_app/common/network/dio_interceptors.dart';
import 'package:mono_app/models/request/login_request.dart';
import 'package:mono_app/models/request/sign_up_request.dart';

abstract class AuthenticationDatasource {
  Future<APIResult> login(LoginRequest request);
  Future<APIResult> signUp(SignUpRequest request);
}

@LazySingleton(as: AuthenticationDatasource)
class AuthenticationDatasourceImpl extends AuthenticationDatasource
    with DatasourceExecutionMixin {
  final HTTPClient httpClient;

  AuthenticationDatasourceImpl(this.httpClient);

  @override
  Future<APIResult> login(LoginRequest request) async {
    return await exec(
      httpClient.dio.post(
        Endpoints.auth.login,
        data: request.toJson(),
      ),
    );
  }

  @override
  Future<APIResult> signUp(SignUpRequest request) async {
    return await exec(
      httpClient.dio.post(
        Endpoints.auth.register,
        data: request.toJson(),
      ),
    );
  }
}
