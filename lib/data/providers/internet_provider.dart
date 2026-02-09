import 'dart:async';

import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';


class InternetCheckService {
  static final InternetCheckService _instance = InternetCheckService._internal();
  factory InternetCheckService() => _instance;
  InternetCheckService._internal();

  final _checker = InternetConnectivity();
  Timer? _timer;

  bool hasConnection = true;

  final StreamController<bool> _controller = StreamController<bool>.broadcast();
  Stream<bool> get onStatusChange => _controller.stream;

  void start() {
    _check();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) => _check());
  }

  void stop() {
    _timer?.cancel();
  }

  Future<void> _check() async {
    final result = await _checker.observeInternetConnection.listen((onData){
      if(!onData){
        print('No Internet Connection');
      }
    });
    await Future.delayed(const Duration(seconds: 10 ));
    result.cancel();
  }

  Future<bool> checkNow() async {
    await _check();
    return hasConnection;
  }

  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}