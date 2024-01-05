import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mono_app/models/request/sign_up_request.dart';
import 'package:mono_app/repositories/authentication.dart';
import 'package:mono_app/screens/register/cubit/register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final AuthenticationRepository authenticationRepository;
  RegisterCubit(this.authenticationRepository) : super(const RegisterState(
    request: SignUpRequest(email: '', password: '')
  ));

  void resgister() async {
    emit(state.copyWith(status: RegisterStatus.initial));
    final result = await authenticationRepository.register(state.request!);
    result.fold(
        (l) => emit(state.copyWith(failure: l, status: RegisterStatus.error)),
        (r) => emit(state.copyWith(status: RegisterStatus.saved)));
  }

  void updatePayload(SignUpRequest request) {
    emit(state.copyWith(request: request));
  }
}
