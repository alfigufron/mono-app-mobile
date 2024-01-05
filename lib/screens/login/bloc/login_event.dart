part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginUpdateRequest extends LoginEvent {
  final LoginRequest request;
  const LoginUpdateRequest({
    required this.request,
  });

  @override
  List<Object?> get props => [
        ...super.props,
      ];
}

class LoginSubmit extends LoginEvent {}

class LoginInvalidate extends LoginEvent {}

class Logout extends LoginEvent {}
