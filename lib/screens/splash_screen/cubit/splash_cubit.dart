import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mono_app/common/constants/storage_keys.dart';
import 'package:mono_app/common/helper/util.dart';
import 'package:mono_app/repositories/authentication.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final FlutterSecureStorage secureStorage;
  final AuthenticationRepository authenticationRepository;
  SplashCubit(this.secureStorage, this.authenticationRepository)
      : super(SplashInitial());

  void checkTokenAvailability() async {
    emit(SplashRetrievingToken());
    await Future.delayed(const Duration(milliseconds: 300));
    final token = await secureStorage.read(key: CommonStorageKeys.token);
    if (!Util.falsyChecker(token)) {
      emit(SplashSuccessRetrievingToken());
    } else {
      await secureStorage.deleteAll();
      emit(SplashFailedRetrievingToken());
    }
  }
}
