

class Config {
  static const environment = String.fromEnvironment('ENV',
      defaultValue: 'DEV' );
  static final Map<String, Map<String, dynamic>> _args = {
    'DEV': _dev,
  };
  static const String _keyBaseUrl = 'baseUrl';
  static const String _keyConnectTimeout = 'connectTimeout';
  static const String _keyReceiveTimeout = 'receiveTimeout';

  static final _dev = {
    _keyBaseUrl: 'https://mono.fronlabs.com/api/v1',
    _keyConnectTimeout: 30 * 1000,
    _keyReceiveTimeout: 30 * 1000,
  };


  static String get baseUrl => _args[environment]![_keyBaseUrl] as String;

  static int get connectTimeout =>
      _args[environment]![_keyConnectTimeout] as int;

  static int get receiveTimeout =>
      _args[environment]![_keyReceiveTimeout] as int;
}
