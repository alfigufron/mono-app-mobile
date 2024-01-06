// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../datasources/authentication.dart' as _i11;
import '../../datasources/transaction.dart' as _i9;
import '../../repositories/authentication.dart' as _i12;
import '../../repositories/transaction.dart' as _i10;
import '../../screens/home/cubit/home_cubit.dart' as _i13;
import '../../screens/login/bloc/login_bloc.dart' as _i14;
import '../../screens/register/cubit/register_cubit.dart' as _i15;
import '../../screens/splash_screen/cubit/splash_cubit.dart' as _i16;
import '../../screens/transaction/cubit/transaction_cubit.dart' as _i17;
import '../network/dio_interceptors.dart' as _i6;
import '../network/network_check.dart' as _i7;
import 'register_module.dart' as _i18;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> $initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.BaseOptions>(() => registerModule.monoDioOptions);
    gh.lazySingleton<_i4.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i5.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.lazySingleton<_i6.HTTPClient>(() => registerModule.apiCaller);
    gh.lazySingleton<_i7.NetworkCheck>(
        () => _i7.NetworkCheckImpl(connectivity: gh<_i4.Connectivity>()));
    await gh.lazySingletonAsync<_i8.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i9.TransactionDatasource>(
        () => _i9.TransactioDatasourceImpl(gh<_i6.HTTPClient>()));
    gh.lazySingleton<_i10.TransactionRepository>(
        () => _i10.TransactionRepositoryImpl(
              networkCheck: gh<_i7.NetworkCheck>(),
              transactionDatasource: gh<_i9.TransactionDatasource>(),
            ));
    gh.lazySingleton<_i11.AuthenticationDatasource>(
        () => _i11.AuthenticationDatasourceImpl(gh<_i6.HTTPClient>()));
    gh.lazySingleton<_i12.AuthenticationRepository>(
        () => _i12.AuthenticationRepositoryImpl(
              networkCheck: gh<_i7.NetworkCheck>(),
              authenticationDatasource: gh<_i11.AuthenticationDatasource>(),
            ));
    gh.factory<_i13.HomeCubit>(
        () => _i13.HomeCubit(gh<_i10.TransactionRepository>()));
    gh.factory<_i14.LoginBloc>(() => _i14.LoginBloc(
          gh<_i5.FlutterSecureStorage>(),
          gh<_i12.AuthenticationRepository>(),
        ));
    gh.factory<_i15.RegisterCubit>(
        () => _i15.RegisterCubit(gh<_i12.AuthenticationRepository>()));
    gh.factory<_i16.SplashCubit>(() => _i16.SplashCubit(
          gh<_i5.FlutterSecureStorage>(),
          gh<_i12.AuthenticationRepository>(),
        ));
    gh.factory<_i17.TransactionCubit>(
        () => _i17.TransactionCubit(gh<_i10.TransactionRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i18.RegisterModule {}
