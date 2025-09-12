import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:sales_agent/core/constans.dart';
import 'package:sales_agent/data/models_api/model_post_url.dart';
import 'package:sales_agent/data/models_api/model_response_url.dart';

import '../../models_api/model_reg_app.dart';
import '../../repositories/apikey_repositori.dart';

class SplashApi{
  final Constant constants = Constant();
  final deviceInfoPlugin = DeviceInfoPlugin();
  final info = NetworkInfo();
  final repository = ApikeyRepository();


  Future<ModelResponseUrl> registerUrl() async {
    ModelPostUrl deviceInfo;

    String licenseCode = await repository.getApiKey() ?? '';
    if (Platform.isAndroid) {
      deviceInfo = await platformAndroid(licenseCode);
    } else {
      deviceInfo = await platformWindows(licenseCode);
    }
    final url = Uri.parse('${constants.API_LICENSE}GetURI');
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('${constants.USERNAME}:${constants.PASSWORD}'))}';
    final response = await http.post(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
    },
      body: jsonEncode(deviceInfo.toJson()),
    ).timeout(Duration(seconds: 5));
    if(response.statusCode == 200){

      final data = jsonDecode(response.body);
      final responseData = ModelResponseUrl.fromJson(data);
      print(responseData);
      return responseData;

    }else if (response.statusCode == 500) {
      throw Exception("error.error500".tr());
    } else if (response.statusCode == 502) {
      throw Exception("error.error502".tr());
    } else if (response.statusCode == 503) {
      throw Exception("error.error503".tr());
    } else if (response.statusCode == 504) {
      throw Exception("error.error504".tr());
    } else if (response.statusCode == 404) {
      throw Exception("error.error404".tr());
    } else if (response.statusCode == 509) {
      throw Exception("error.error509".tr());
    } else if (response.statusCode == 520) {
      throw Exception("error.error520".tr());
    } else if (response.statusCode == 521) {
      throw Exception("error.error521".tr());
    } else if (response.statusCode == 524) {
      throw Exception("error.error524".tr());
    } else if (response.statusCode == 525) {
      throw Exception("error.error525".tr());
    } else {
      // Если сервер вернул статус ошибки (не 200), бросаем исключение
      throw Exception("Ошибка сервера: ${response.statusCode}");

    }
  }

  Future<ModelPostUrl> platformWindows(String license) async {
    try {
      WindowsDeviceInfo windows = await deviceInfoPlugin.windowsInfo;
      final String applicationVersion = '1.0.0';
      final String deviceID = windows.deviceId;
      final String deviceModel = windows.computerName;
      final String deviceName = windows.productName;
      final String osVersion = windows.productId;
      final int osType = constants.salesAgent;

      final String? privateIP = await info.getWifiIP();
      final String publicIP = await getPublicIP();

      final String salePointAddress = '123 Main St';
      final String serialNumber = windows.releaseId;
      final String workplace = 'Office';
      final String licenseActivationCode = license;
      return ModelPostUrl(
        applicationVersion: applicationVersion,
        deviceID: deviceID,
        deviceModel: deviceModel,
        deviceName: deviceName,
        osType: osType,
        osVersion: osVersion,
        privateIP: privateIP ?? 'Unknown',
        publicIP: publicIP,
        salePointAddress: salePointAddress,
        serialNumber: serialNumber,
        workplace: workplace,
        lastAuthorizedUser: '',
        licenseID: licenseActivationCode,
      );
    } catch (e) {
      throw Exception("ошибка platform windows: ${e.toString()}");
    }
  }

  Future<ModelPostUrl> platformAndroid(String license) async {
    try {
      AndroidDeviceInfo android = await deviceInfoPlugin.androidInfo;
      final String applicationVersion = '1.0.0';
      final String deviceID = android.id;
      final String deviceModel = android.model;
      final String deviceName = android.device;
      final String osVersion = android.version.baseOS ?? '';
      final int osType = constants.salesAgent;
      final String? privateIP = await info.getWifiIP();
      final String publicIP = await getPublicIP();

      final String salePointAddress = '123 Main St';
      final String serialNumber = android.serialNumber;
      final String workplace = 'Office';
      final String licenseActivationCode = license;
      return ModelPostUrl(
        applicationVersion: applicationVersion,
        deviceID: deviceID,
        deviceModel: deviceModel,
        deviceName: deviceName,
        osType: osType,
        osVersion: osVersion,
        privateIP: privateIP ?? 'Unknown',
        publicIP: publicIP,
        salePointAddress: salePointAddress,
        serialNumber: serialNumber,
        workplace: workplace,
        lastAuthorizedUser: '',
        licenseID: licenseActivationCode,
      );
    } catch (e) {
      throw Exception("ошибка platform android: ${e.toString()}");
    }
  }


  Future<String> getPublicIP() async {
    try {
      final response =
      await http.get(Uri.parse('https://api.ipify.org?format=json'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['ip'];
      } else {
        throw Exception('Failed to get public IP');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching public IP: $e');
      }
      return 'Unknown';
    }
  }

}