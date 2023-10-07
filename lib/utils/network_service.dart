import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  final Connectivity _connectivity;

  NetworkService(this._connectivity);

  Stream<bool> get isConnected {
    return _connectivity.onConnectivityChanged
        .map(isConnectedFromConnectivityResult);
  }

  bool isConnectedFromConnectivityResult(ConnectivityResult result) {
    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }
}
