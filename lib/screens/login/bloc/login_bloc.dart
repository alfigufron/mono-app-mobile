import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mono_app/common/constants/storage_keys.dart';
import 'package:mono_app/common/failures/base_failure.dart';
import 'package:mono_app/common/failures/common_failure.dart';
import 'package:mono_app/models/common/token.dart';
import 'package:mono_app/models/request/login_request.dart';
import 'package:mono_app/models/user.dart';
import 'package:mono_app/repositories/authentication.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FlutterSecureStorage secureStorage;
  final AuthenticationRepository authenticationRepository;

  LoginBloc(
    this.secureStorage,
    this.authenticationRepository,
  ) : super(const LoginState(
          request: LoginRequest(
            email: '',
            password: '',
          ),
        )) {
    on<LoginUpdateRequest>(_updateRequest);
    on<LoginSubmit>(_submit);
    on<LoginInvalidate>(_invalidate);
    on<Logout>(_logout);
  }

  void _updateRequest(LoginUpdateRequest event, emit) {
    emit(state.copyWith(
      request: event.request,
    ));
  }

  void _submit(LoginSubmit event, emit) async {
    emit(LoginLoadingState(newState: state));
    await secureStorage.deleteAll();
    final result = await authenticationRepository.login(state.request!);
    await result.fold((l) async {
      await secureStorage.deleteAll();
      emit(LoginFailedState(newState: state.copyWith(failure: l)));
    }, (r) async {
      _setLocalUserInfo(r);
      return emit(LoginSuccessState(newState: state.copyWith(user: r.user)));
    });
  }

  void _logout(Logout event, emit) async {
    emit(LogoutLoadingState(newState: state));
    await secureStorage.deleteAll();
    // logout handler
    emit(LogoutSuccessState(newState: state));
  }

  void _setLocalUserInfo(Token token) async {
    await secureStorage.write(
      key: CommonStorageKeys.token,
      value: token.toJson(),
    );
    await secureStorage.write(
      key: CommonStorageKeys.email,
      value: state.request?.email,
    );
  }

  void _invalidate(LoginInvalidate event, emit) async {
    try {
      await secureStorage.deleteAll();
    } catch (e) {
      emit(LoginFailedState(
          newState: state.copyWith(
              failure: GeneralFailure(
        message: '$e',
        prefixMessage: 'Error : ',
      ))));
    }
  }
}
