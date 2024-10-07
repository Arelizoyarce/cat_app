import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> networkVerify() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult[0] == ConnectivityResult.wifi ||
      connectivityResult[0] == ConnectivityResult.mobile;
}
