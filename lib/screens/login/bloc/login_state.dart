part of 'login_bloc.dart';

class LoginState extends Equatable {
  final LoginRequest? request;
  final BaseFailure? failure;
  final User? user;
  const LoginState({
    this.request,
    this.failure,
    this.user,
  });

  @override
  List<Object?> get props {
    return [
      request,
      failure,
      user,
    ];
  }

  LoginState copyWith({
    LoginRequest? request,
    BaseFailure? failure,
    User? user,
  }) {
    return LoginState(
      request: request ?? this.request,
      failure: failure ?? this.failure,
      user: user ?? this.user,
    );
  }
}

class LoginLoadingState extends LoginState {
  final LoginState newState;
  LoginLoadingState({
    required this.newState,
  }) : super(
          request: newState.request,
          failure: newState.failure,
          user: newState.user,
        );
}

class LoginSuccessState extends LoginState {
  final LoginState newState;
  LoginSuccessState({
    required this.newState,
  }) : super(
          request: newState.request,
          failure: newState.failure,
          user: newState.user,
        );
}

class LoginFailedState extends LoginState {
  final LoginState newState;
  LoginFailedState({
    required this.newState,
  }) : super(
          request: newState.request,
          failure: newState.failure,
          user: newState.user,
        );
}

class LogoutLoadingState extends LoginState {
  final LoginState newState;
  LogoutLoadingState({
    required this.newState,
  }) : super(
          request: newState.request,
          failure: newState.failure,
          user: newState.user,
        );
}

class LogoutSuccessState extends LoginState {
  final LoginState newState;
  LogoutSuccessState({
    required this.newState,
  }) : super(
          request: newState.request,
          failure: newState.failure,
          user: newState.user,
        );
  @override
  List<Object?> get props => [...super.props];
}
