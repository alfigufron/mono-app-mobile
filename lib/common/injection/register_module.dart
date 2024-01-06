import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mono_app/common/network/dio_interceptors.dart';
import 'package:mono_app/common/network/dio_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ));

  @lazySingleton
  BaseOptions get monoDioOptions => MonoDioOptions().baseOptions;

  @lazySingleton
  HTTPClient get apiCaller => HTTPClient(
        dio,
        secureStorage,
      );

  @lazySingleton
  Dio get dio => Dio(monoDioOptions);
}
