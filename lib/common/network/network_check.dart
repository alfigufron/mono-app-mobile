import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkCheck {
  Future<bool> isOnline();
}

@LazySingleton(as: NetworkCheck)
class NetworkCheckImpl implements NetworkCheck {
  final Connectivity connectivity;
  NetworkCheckImpl({
    required this.connectivity,
  });
  @override
  Future<bool> isOnline() async {
    final connectivityResult = await connectivity.checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }
}
