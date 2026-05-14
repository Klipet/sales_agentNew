import 'dart:convert';

import 'package:sales_agent/data/repositories/apikey_repositori.dart';

import '../core/constans.dart';
import '../data/models_api/models_api_server/log_request.dart';
import '../data/providers/api_provider/log_request_post_api.dart';

class AppLogger {
  static final AppLogger _instance = AppLogger._internal();
  factory AppLogger() => _instance;

  AppLogger._internal();

  late final LogRequestPostApi _logService;
  late final ApikeyRepository _apiKeyRepository;

  void init({
    required LogRequestPostApi logService,
    required ApikeyRepository apiKeyRepository,
  }) {
    _logService = logService;
    _apiKeyRepository = apiKeyRepository;
  }

  Future<void> log({
    required String action,
    dynamic message,
    String details = '',
    int type = 1,
    String? entity,
  }) async {
    try {
      final settings = await _apiKeyRepository.getSettings();

      final encodedMessage = _safeEncode(message);

      final request = LogRequest(
        source: Constant().APPNAME,
        action: action,
        message: encodedMessage,
        details: details,
        hostName: '',
        ip: '',
        type: type,
        domain: '',
        entity: settings?.codeLicense ?? '',
        appVersion: '',
        date: DateTime.now(),
        os: 'Android',
        ram: '',
        hdd: '',
        company: settings?.company ?? '',
        companyID: 0,
        licenseID: settings?.apiKey ?? '',
      );

      await _logService.logPostServer(logRequest: request);
    } catch (e) {
      print('LOG ERROR: $e');
    }
  }

  String _safeEncode(dynamic data) {
    try {
      if (data == null) return '';
      if (data is String) return data;

      if (data is Map || data is List) {
        return jsonEncode(data);
      }

      // если есть toJson
      final dynamic json = data.toJson();
      return jsonEncode(json);
    } catch (_) {
      return data.toString();
    }
  }
}