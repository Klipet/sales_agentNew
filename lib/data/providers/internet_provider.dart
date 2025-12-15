import 'dart:async';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetCheckService {
  static final InternetCheckService _instance = InternetCheckService._internal();
  factory InternetCheckService() => _instance;
  InternetCheckService._internal();

  final _checker = InternetConnection();
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
    final result = await _checker.hasInternetAccess;

    if (result != hasConnection) {
      hasConnection = result;
      _controller.add(result);
    }
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