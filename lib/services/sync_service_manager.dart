import 'package:flutter/services.dart';

class SyncServiceManager {
  static const _channel = MethodChannel('com.example.sales_agent/sync');

  // Запустить сервис
  static Future<void> start() async {
    try {
      await _channel.invokeMethod('startSyncService');
    } catch (e) {
      print('SyncService start error: $e');
    }
  }

  // Остановить сервис
  static Future<void> stop() async {
    try {
      await _channel.invokeMethod('stopSyncService');
    } catch (e) {
      print('SyncService stop error: $e');
    }
  }
}