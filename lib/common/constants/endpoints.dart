import 'package:mono_app/config.dart';

final String _baseUrl = Config.baseUrl;

class Endpoints {
  static const auth = _Auth();
  static const transaction = _Transaction();
}

class _Auth {
  const _Auth();
  String get _baseAuth => '$_baseUrl/auth';
  String get login => '$_baseAuth/login';
  String get register => '$_baseAuth/register';
}

class _Transaction {
  const _Transaction();
  String get _baseTransaction => '$_baseUrl/transaction';
  String get getAll => _baseTransaction;
  String get wallet => '$_baseTransaction/wallet';
  String get detail => '$_baseTransaction/%s';
  String get create => _baseTransaction;
  String get update => '$_baseTransaction/%s';
  String get delete => '$_baseTransaction/%s';
}
