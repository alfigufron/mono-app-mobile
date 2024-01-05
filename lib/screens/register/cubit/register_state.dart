// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:mono_app/common/failures/base_failure.dart';
import 'package:mono_app/models/request/sign_up_request.dart';

enum RegisterStatus { initial, loading, error, saved }

class RegisterState extends Equatable {
  final RegisterStatus? status;
  final SignUpRequest? request;
  final BaseFailure? failure;
  
  const RegisterState({
    this.status,
    this.request,
    this.failure,
  });

  @override
  List<Object?> get props => [status, request, failure];

  RegisterState copyWith({
    RegisterStatus? status,
    SignUpRequest? request,
    BaseFailure? failure,
  }) {
    return RegisterState(
      status: status ?? this.status,
      request: request ?? this.request,
      failure: failure ?? this.failure,
    );
  }
}
